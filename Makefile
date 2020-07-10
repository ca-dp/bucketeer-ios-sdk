APP_NAME=Bucketeer

CONFIGURATION ?= Debug
SCHEME ?= $(APP_NAME)
DEVICE ?= "iPhone\ 11"

XCODEBUILD=xcodebuild

OPTIONS=\
	-workspace $(APP_NAME).xcworkspace \
	-scheme $(SCHEME)

EXAMPLE_OPTIONS=\
	-workspace $(APP_NAME).xcworkspace \
	-scheme Example

DESTINATION=-destination "name=$(DEVICE)"

CLEAN=rm -rf build
SHOW_BUILD_SETTINGS=$(XCODEBUILD) $(OPTIONS) $(DESTINATION) \
	-configuration $(CONFIGURATION) \
	-showBuildSettings
BUILD=$(XCODEBUILD) $(OPTIONS) $(DESTINATION) \
	-configuration $(CONFIGURATION) \
	build
BUILD_FOR_TESTING=$(XCODEBUILD) $(OPTIONS) $(DESTINATION) \
	-configuration Test \
	build-for-testing
TEST_WITHOUT_BUILDING=$(XCODEBUILD) $(OPTIONS) $(DESTINATION) \
	-configuration Test \
	-skip-testing:BucketeerTests/BucketeerE2ETest \
	test-without-building
E2E_WITHOUT_BUILDING=$(XCODEBUILD) $(OPTIONS) $(DESTINATION) \
	-configuration Test \
	-only-testing:BucketeerTests/BucketeerE2ETest \
	test-without-building
ALL_TEST_WITHOUT_BUILDING=$(XCODEBUILD) $(OPTIONS) $(DESTINATION) \
	-configuration Test \
	test-without-building
BUILD_EXAMPLE=$(XCODEBUILD) $(EXAMPLE_OPTIONS) $(DESTINATION) \
	-configuration $(CONFIGURATION) \
	build

.PHONY: clean
clean:
	$(CLEAN)

.PHONY: settings
settings:
	$(SHOW_BUILD_SETTINGS)

.PHONY: build
build: copy-protos
	$(BUILD)

.PHONY: build-for-testing
build-for-testing: copy-protos
	$(BUILD_FOR_TESTING)

.PHONY: test-without-building
test-without-building:
	$(TEST_WITHOUT_BUILDING)

.PHONY: e2e-without-building
e2e-without-building:
	$(E2E_WITHOUT_BUILDING)

.PHONY: all-test-without-building
all-test-without-building:
	$(ALL_TEST_WITHOUT_BUILDING)

.PHONY: build-example
build-example:
	$(BUILD_EXAMPLE)

.PHONY: deps
deps:
	bundle install
	bundle exec pod install
	bundle exec fastlane setup

.PHONY: copy-protos
copy-protos:
	make -C ../bucketeer/proto swift
	rm -rf Bucketeer/Sources/proto
	mv ../bucketeer/proto/swift_output/proto Bucketeer/Sources/