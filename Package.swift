// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "YopuyAlamofire",
    dependencies: [
      .Package(url: "https://github.com/Alamofire/Alamofire.git", majorVersion: 4),
      .Package(url: "https://github.com/lukesutton/Yopuy.git", majorVersion: 0)
    ]
)
