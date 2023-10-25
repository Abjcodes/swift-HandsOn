//
//  ProductResponse.swift
//  makeUpProducts
//
//  Created by P10 on 19/10/23.
//

import Foundation

struct ProductResponse: Codable {
    let apiFeaturedImage: String?
    let brand: String?
    let category: String?
    let createdAt: String?
    let currency: String?
    let description: String?
    let id: Int
    let imageLink: String?
    let name: String?
    let price: String?
    let priceSign: String?
    let productApiUrl: String?
    let productColors: [ProductColor]?
    let productLink: String?
    let productType: String?
    let rating: Float?
    let tagList: [String]?
    let updatedAt: String?
    let websiteLink: String?

    enum CodingKeys: String, CodingKey {
        case apiFeaturedImage = "api_featured_image"
        case brand
        case category
        case createdAt = "created_at"
        case currency
        case description
        case id
        case imageLink = "image_link"
        case name
        case price
        case priceSign = "price_sign"
        case productApiUrl = "product_api_url"
        case productColors = "product_colors"
        case productLink = "product_link"
        case productType = "product_type"
        case rating
        case tagList = "tag_list"
        case updatedAt = "updated_at"
        case websiteLink = "website_link"
    }
}

struct ProductColor: Codable {
    let colourName: String?
    let hexValue: String?

    enum CodingKeys: String, CodingKey {
        case colourName = "colour_name"
        case hexValue = "hex_value"
    }
}

