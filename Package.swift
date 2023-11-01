// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AutoEnablePulseService",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "AutoEnablePulseService", targets: ["AutoEnablePulseService"]),
        .library(name: "PulseService", targets: ["PulseService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Pulse.git", branch: "main"),
    ],
    targets: [
        .target(name: "AutoEnablePulseService",
                dependencies: ["PulseService"],
                publicHeadersPath: "include"),
        .target(name: "PulseService", dependencies: ["Pulse"]),
    ]
)
