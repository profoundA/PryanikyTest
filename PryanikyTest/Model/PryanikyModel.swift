//
//  PryanikyModel.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 27.05.2022.
//

import Foundation

struct PryanikyModel: Codable {
    let data: [DataArray]
    let view: [String]
}

struct DataArray: Codable {
    let name: String?
    let data: DataInfo?
}

struct DataInfo: Codable {
    let url: String?
    let text: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int?
    let text: String?
}
