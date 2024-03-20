//
//  ImageService.swift
//  DemoDogsApp
//
//  Created by Анастасия on 13.03.2024.
//

import Foundation
import UIKit

class ImageService {
    

    func fetchDogImage(name: String, completion: @escaping (UIImage?) -> Void) {
        
        let urlString = "https://dog.ceo/api/breed/hound/images"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
            } else if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let imageUrlStrings = json["message"] as? [String],
                       let randomImageUrlString = imageUrlStrings.randomElement(),
                       let imageUrl = URL(string: randomImageUrlString),
                       let imageData = try? Data(contentsOf: imageUrl),
                       let image = UIImage(data: imageData) {
                        completion(image)
                    } else {
                        print("Could not parse JSON or load image")
                        completion(nil)
                    }
                } catch {
                    print("Error: \(error)")
                    completion(nil)
                }
            }
        }

        task.resume()
    }

    
}
