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
       .package(url: "https://github.com/MakeAWishFoundation/SwiftyMocky", .branch("develop")),
    ],
    targets: [
        .target(
            name: "Unit",
            dependencies: [
                "SwiftyPrototype",
            ]
        ),
        .testTarget(
            name: "UnitTests",
            dependencies: [
                "Unit",
                "SwiftyMocky"
            ]
        ),
    ]
)
