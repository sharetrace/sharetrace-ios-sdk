// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharetraceSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SharetraceSDK",
            targets: ["SharetraceSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "SharetraceSDK",
            url: "https://github.com/sharetrace/sharetrace-ios-sdk/releases/download/2.5.0/SharetraceSDK.xcframework.zip",
            checksum: "99d0759b372a476547807a54f17a55b0067136e4be5e9b4cbc7bc43981ec2d0b"
        )
    ]
)

