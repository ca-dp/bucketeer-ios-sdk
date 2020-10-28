[![Build Status](https://app.bitrise.io/app/b2a26a787a314dad/status.svg?token=dbGgTCEurcQ8NoD64CekLA&branch=master)](https://app.bitrise.io/app/b2a26a787a314dad)

# Bucketeer SDK for iOS

## Setup

Install prerequisite tools.

- Xcode
- Ruby
- protoc

```
brew install protobuf
```

- [protoc-gen-swift](https://github.com/grpc/grpc-swift#getting-the-plugins)

```
git clone git@github.com:grpc/grpc-swift.git /tmp/grpc-swift
cd /tmp/grpc-swift
git checkout 1.0.0-alpha.19
make plugins
cp protoc-gen-swift protoc-gen-grpc-swift /usr/local/bin
```

- [googleapis/googleapis](https://github.com/googleapis/googleapis)

```
git clone git@github.com:googleapis/googleapis.git $GOPATH/src/github.com/googleapis/googleapis
```

Then, you need to create `fastlane/.env`.

```
apiURL=<API_URL> # e.g. api-uat.bucketeer.jp
sdkKey=<SDK_KEY>
```

Install dependencies.

```
make deps
```

## Development

### Development with Xcode

Open `Bucketeer.xcworkspace` with Xcode.

### Development with command line

#### SDK

Build SDK.

```
make build
```

Build SDK for testing.

```
make build-for-testing
```

Run unit tests without build.

```
make test-without-building
```

Run e2e tests without build.

```
make e2e-without-building
```

#### Example

Build Example.

```
make build-example
```

## SDK User Docs

- [Tutorial](https://bucketeer.io/docs/#/sdk-tutorial-ios)
- [Integration](https://bucketeer.io/docs/#/sdk-reference-guides-ios)
