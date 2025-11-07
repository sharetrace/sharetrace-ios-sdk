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
            path: "lib/SharetraceSDK.xcframework"
        )
    ]
)

