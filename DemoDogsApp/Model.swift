//
//  Model.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//

import Foundation

// Создаем структуру для хранения данных о породах собак

struct DogBreeds: Codable {
    let message: [String: [String]]
}