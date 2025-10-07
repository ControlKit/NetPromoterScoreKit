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
    dependencies: [
        .package(
            url: "https://github.com/ControlKit/ControlKitBase.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "NetPromoterScoreKit",
            dependencies: ["ControlKitBase"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NetPromoterScoreKitTests",
            dependencies: ["NetPromoterScoreKit"]
        ),
    ]
)
