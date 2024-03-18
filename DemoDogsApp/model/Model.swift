//
//  Model.swift
//  DemoDogsApp
//
//  Created by Анастасия on 26.02.2024.
//

import Foundation

//MARK: -Создаем структуру для хранения данных о породах собак

struct DogBreeds: Decodable {
    
    let message: [String: [String]]
    let status: String
}

struct BreedDetails: Decodable {
    let message: [String]
    let status: String
}

struct ImageDogs: Decodable {
    let message: [String]
    let status: String
}
