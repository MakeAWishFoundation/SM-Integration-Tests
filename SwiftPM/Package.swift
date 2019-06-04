// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Unit",
    products: [
        .library(
            name: "Unit",
            targets: ["Unit"]
        ),
    ],
    dependencies: [
       .package(url: "https://github.com/MakeAWishFoundation/SwiftyMocky", from: "3.3.1"),
    ],
    targets: [
        .target(
            name: "Unit",
            dependencies: []),
        .testTarget(
            name: "UnitTests",
            dependencies: [
                "Unit",
                "SwiftyMocky"
            ]),
    ]
)
