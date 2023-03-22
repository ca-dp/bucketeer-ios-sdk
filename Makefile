PROTO_TOP_DIR := $(shell cd ../bucketeer && pwd)
PROTOBUF_INCLUDE_DIR := ${PROTO_TOP_DIR}/proto/external/protocolbuffers/protobuf/v3.9.0
PROTO_FOLDERS := event/client feature gateway user
PROTO_OUTPUT := proto_output

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
build:
	$(BUILD)

.PHONY: build-for-testing
build-for-testing:
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

.PHONY: setup
setup:
	./scripts/setup.sh

.PHONY: deps
deps:
	bundle install
	bundle exec pod install

.PHONY: copy-protos
copy-protos: .gen-protos
	rm -rf Bucketeer/Sources/proto
	mv $(PROTO_OUTPUT)/proto Bucketeer/Sources/

.PHONY: .gen-protos
.gen-protos:
	if [ -d ${PROTO_OUTPUT} ]; then rm -fr ${PROTO_OUTPUT}; fi; \
	mkdir ${PROTO_OUTPUT}; \
	for f in ${PROTO_FOLDERS}; do \
		protoc -I"$(PROTO_TOP_DIR)" \
			-I"${PROTOBUF_INCLUDE_DIR}" \
			-I"${GOPATH}/src/github.com/googleapis/googleapis" \
			--swift_out=./${PROTO_OUTPUT} \
			--grpc-swift_out=Client=true,Server=false:./${PROTO_OUTPUT} \
			${PROTO_TOP_DIR}/proto/$$f/*.proto; \
	done; \
	for file in $$(find ./${PROTO_OUTPUT} -name "*.swift"); do \
		var=$$(basename $$file); \
		dir=$$(dirname $$file); \
		dirName=$${dir##*/}; \
		mv $$file $$dir/$$dirName"_"$$var; \
	done
