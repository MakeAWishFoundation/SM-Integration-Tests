// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPM",
    products: [
        .executable(name: "executable", targets: ["App"]),
        .library(name: "UnitLibrary", targets: ["UnitLibrary"]),
    ],
    dependencies: [
       .package(url: "https://github.com/MakeAWishFoundation/SwiftyMocky", .branch("master")),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: ["UnitLibrary"]
        ),
        .target(
            name: "UnitLibrary",
            dependencies: ["SwiftyPrototype"]
        ),
        .testTarget(
            name: "UnitTests",
            dependencies: [
                "UnitLibrary",
                "SwiftyMocky",
            ]
        ),
    ]
)
