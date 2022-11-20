[![Build Status](https://app.bitrise.io/app/b2a26a787a314dad/status.svg?token=dbGgTCEurcQ8NoD64CekLA&branch=master)](https://app.bitrise.io/app/b2a26a787a314dad)

# Bucketeer Client-side SDK for iOS

## Setup

Install prerequisite tools.

- Xcode

Setup environments.

```sh
make setup
```

## Development

### Development with Xcode

Open `Bucketeer.xcodeproj` with Xcode.

### Development with command line

#### SDK

Build SDK.

```sh
make build
```

Build SDK for testing.

```sh
make build-for-testing
```

Run unit tests without build.

```sh
make test-without-building
```

Run e2e tests without build.

```sh
make e2e-without-building
```

#### Example

Build Example.

```sh
make build-example
```

### Tips

#### Use published SDK in Example

TODO

## Contributing

[CONTRIBUTING.md](./CONTRIBUTING.md)

## SDK User Docs

- [Tutorial](https://bucketeer.io/docs/#/./client-side-sdk-tutorial-ios)
- [Integration](https://bucketeer.io/docs/#/./client-side-sdk-reference-guides-ios)

## Samples

[Bucketeer Samples](https://github.com/ca-dp/bucketeer-samples)
