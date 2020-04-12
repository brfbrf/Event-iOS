// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
import PackageDescription

let package = Package(
    name: "Dependencies",
    products: [
        .library(
            name: "Dependencies",
            type: .dynamic,
            targets: ["Dependencies"]),
    ],
    dependencies: [
        .package(url: "https://github.com/brfbrf/EventShared.git", from: "0.1.5"),
    ],
    targets: [
        .target(
            name: "Dependencies",
            dependencies: ["EventShared"],
            path: "."
        )
    ]
)
