//
//  EarthquakeModel.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation

// MARK: - Earthquake
struct Earthquake: Codable {
    let features: [Feature]?
}

// MARK: - Feature
struct Feature: Codable {
    let type: String?
    let properties: Properties?
    let geometry: Geometry?
    let id: String?
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String?
    let coordinates: [Double]?
}

// MARK: - Properties
struct Properties: Codable {
    let mag: Double?
    let time: Int64?
    let url: String?
    let title: String?
}
