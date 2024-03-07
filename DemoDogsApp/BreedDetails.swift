//
//  BreedDetails.swift
//  DemoDogsApp
//
//  Created by Анастасия on 06.03.2024.
//

import Foundation

//MARK: - сервис который получает детальные данные о собаках

class BreedDetailService {

func fetchBreedDetails(breedName: String, completion: @escaping (Result<BreedDetails, Error>) -> Void) {
    let urlString = "https://api.api-ninjas.com/v1/dogs?name=\(breedName)"
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let breedDetails = try decoder.decode(BreedDetails.self, from: data)
            completion(.success(breedDetails))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}
}

