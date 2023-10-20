//
//  ProductResponse.swift
//  makeUpProducts
//
//  Created by P10 on 19/10/23.
//

import Foundation


struct ProductResponse: Codable {
    let api_featured_image: String?
    let brand: String?
    let category: String?
    let created_at: String?
    let currency: String?
    let description: String?
    let id: Int
    let image_link: String?
    let name: String?
    let price: String?
    let price_sign: String?
    let product_api_url: String?
    let product_colors: [ProductColor]?
    let product_link: String?
    let product_type: String?
    let rating: Float?
    let tag_list: [String]?
    let updated_at: String?
    let website_link: String?
}

struct ProductColor: Codable {
    let colour_name: String?
    let hex_value: String?
}

