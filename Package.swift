// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "IGListKit",
    platforms: [ .iOS(.v11),
                 .tvOS(.v11),
                 .macOS(.v10_13),
    ],
    products: [
        .library(name: "IGListDiffKit",
                 targets: ["IGListDiffKit"]),
        .library(name: "IGListKit",
                 targets: ["IGListKit"]),
        .library(name: "IGListSwiftKit",
                 targets: ["IGListSwiftKit"]),
    ],
    targets: [
        .target(
            name: "IGListDiffKit",
            path: "spm/Sources/IGListDiffKit",
            publicHeadersPath: "include",
            cSettings: [.define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))]
        ),
        .target(
            name: "IGListKit",
            dependencies: ["IGListDiffKit"],
            path: "spm/Sources/IGListKit",
            publicHeadersPath: "include",
            cSettings: [.define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))]
        ),
        .target(
            name: "IGListSwiftKit",
            dependencies: ["IGListKit"],
            path: "spm/Sources/IGListSwiftKit",
            cSettings: [.define("NS_BLOCK_ASSERTIONS", to: "1", .when(configuration: .release))]
        ),
    ],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)
