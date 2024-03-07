//
//  ReportService .swift
//  DemoDogsApp
//
//  Created by Анастасия on 06.03.2024.
//

import Foundation

//MARK: - Сервис который получает данные о всех породах
class ReportService {

func fetchDogBreeds(completion: @escaping (Result<DogBreeds, Error>) -> Void) {
    let urlString = "https://dog.ceo/api/breeds/list/all"
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
            let breeds = try decoder.decode(DogBreeds.self, from: data)
            completion(.success(breeds))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

}
