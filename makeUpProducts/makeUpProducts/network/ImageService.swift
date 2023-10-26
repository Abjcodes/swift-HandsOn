//
//  ImageService.swift
//  makeUpProducts
//
//  Created by P10 on 26/10/23.
//

import UIKit

class ImageService {
    static let shared = ImageService()
    
    private init() {}
    
    private var imageCache = NSCache<NSURL, UIImage>()
    
    func loadImage(fromURL url: URL, completion: @escaping (UIImage?) -> Void) {
        // Check if the image is already in the cache
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                // Cache the downloaded image
                self?.imageCache.setObject(image, forKey: url as NSURL)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
