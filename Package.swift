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
            url: "https://github.com/sharetrace/sharetrace-ios-sdk/releases/download/2.4.3/SharetraceSDK.xcframework.zip",
            checksum: "582c7ca002be8d2381f20010990c3233a5eaf99cad68315c1af6d57bf67fe8b7"
        )
    ]
)

