// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetPromoterScoreKit",
    platforms: [
         .iOS(.v13)
    ],
    products: [
        .library(
            name: "NetPromoterScoreKit",
            targets: ["NetPromoterScoreKit"]
        ),
    ],
    targets: [
        .target(
            name: "NetPromoterScoreKit",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NetPromoterScoreKitTests",
            dependencies: ["NetPromoterScoreKit"]
        ),
    ]
)
