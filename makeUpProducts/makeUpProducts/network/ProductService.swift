//
//  productService.swift
//  makeUpProducts
//
//  Created by P10 on 19/10/23.
//

import Foundation

class ProductService{
    static let shared = ProductService()
        
        private init() {}
        
        func fetchMakeupProducts(completion: @escaping ([ProductResponse]?, Error?) -> Void) {
            guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json") else {
                completion(nil, APIError.invalidURL)
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data{
                    do {
                        print(data)
                        let decoder = JSONDecoder()
                        let productResponse = try decoder.decode([ProductResponse].self, from: data)
                        completion(productResponse, nil)
                       } catch {
                        print("Error parsing JSON: \(error)")
                       }
                } else {
                    completion(nil, APIError.noData)
                }
            }.resume()
        }
    }

    enum APIError: Error {
        case invalidURL
        case noData
    }
