// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "runway",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "../SwiftBase", .branch("master"))
    ],
    targets: [
        // Library
        .target(
            name: "RunwayCommon",
            dependencies: []),
        .target(
            name: "RunwayCore",
            dependencies: ["SourceryJava"]),
        .target(
            name: "RunwayModule",
            dependencies: ["RunwayCommon"]),
        .target(
            name: "RunwayPackage",
            dependencies: ["RunwayCommon", "RunwayModule"]),


        .target(
            name: "Sourcery",
            dependencies: []),
        .target(
            name: "SourceryJava",
            dependencies: ["Sourcery"]),

        // Command line tool targets
        .target(
            name: "runway",
            dependencies: [
                "SwiftBase",

                "RunwayCommon",
                "RunwayCore",
                "RunwayModule",
                "RunwayPackage",
                
                "Sourcery",
                "SourceryJava",
                ],
            path: "Sources/runway"),


        .testTarget(
            name: "runwayTests",
            dependencies: ["runway"]),
    ]
)
