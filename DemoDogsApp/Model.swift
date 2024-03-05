//
//  Model.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//

import Foundation

// Создаем структуру для хранения данных о породах собак


struct DogBreeds: Decodable {
    let message: [String: [String]]
    let status: String
}
//extension DogsBreed {
//    init(data: Data) throws {
//        self = try JSONDecoder().decode(DogsBreed.self, from: data)
//    }
//}
