// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPM",
    products: [
        .library(
            name: "Prototype",
            targets: ["Prototype"]
        ),
        .library(
            name: "UnitTests",
            targets: ["UnitTests"]
        ),
    ],
    dependencies: [
       .package(url: "https://github.com/MakeAWishFoundation/SwiftyMocky", .branch("master")),
    ],
    targets: [
        .target(
            name: "Prototype",
            dependencies: [
                .product(name: "SwiftyPrototype", package: "SwiftyMocky"),
            ]
        ),
        .testTarget(
            name: "UnitTests",
            dependencies: [
                "Prototype",
                "SwiftyMocky"
            ]
        ),
    ]
)
