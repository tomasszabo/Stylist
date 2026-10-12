// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Stylist",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
    ],
    products: [
        .library(name: "Stylist", targets: ["Stylist"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "6.2.2"),
        .package(url: "https://github.com/krzysztofzablocki/KZFileWatchers.git", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "Stylist",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "KZFileWatchers", package: "KZFileWatchers"),
            ],
            path: "Stylist",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "StylistTests",
            dependencies: ["Stylist", .product(name: "Yams", package: "Yams")],
            path: "Tests",
            exclude: ["LinuxMain.swift", "Info.plist"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
