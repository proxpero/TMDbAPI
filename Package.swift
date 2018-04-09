// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TMDbAPI",
    products: [
        .library(
            name: "TMDbAPI",
            targets: ["TMDbAPI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TMDbAPI",
            dependencies: []),
        .testTarget(
            name: "TMDbAPITests",
            dependencies: ["TMDbAPI"]),
    ]
)
