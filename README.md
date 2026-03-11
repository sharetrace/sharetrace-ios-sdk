# sharetrace-ios-sdk

ShareTrace Official SDK for iOS, [Check out this document](https://sharetrace.com/docs/guide/ios.html)

## Installation

### Swift Package Manager

#### Via Xcode
1. File → Add Packages...
2. Enter repository URL: `https://github.com/sharetrace/sharetrace-ios-sdk`
3. Select version rule (Recommended: Up to Next Major Version)
4. Add to your project

#### Via Package.swift
```swift
dependencies: [
    .package(url: "https://github.com/sharetrace/sharetrace-ios-sdk", from: "2.4.2")
]
```

### CocoaPods
```ruby
pod 'SharetraceSDK'
```

## Release Guide

For maintainers publishing new versions, see [SPM_RELEASE_GUIDE.md](SPM_RELEASE_GUIDE.md)
