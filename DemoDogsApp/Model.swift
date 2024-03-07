//
//  Model.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//

import Foundation

//MARK: -Создаем структуру для хранения данных о породах собак


struct BreedDetails: Identifiable, Decodable {
    let id: UUID
    let name: String
    let temperament: String
    let lifeSpan: String
    let max_life_expectancy: Int
    let max_height_male: Int
    // Добавьте другие свойства, если необходимо
}

struct DogBreeds: Decodable {
    
    let message: [String: [String]]
    let status: String
}


