//
//  Model.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//

import Foundation

// Создаем структуру для хранения данных о породах собак

struct DogsBreed: Codable {
    let message: [String: [String]]
    let status: String
}

//struct DogBreeds: Codable {
//    let message: [String: [String]]
//}
