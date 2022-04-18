//
//  Model.swift
//  JsonHomeWork
//
//  Created by Максим Гурков on 17.04.2022.
//

struct RickAndMorty: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let image: String?
}

enum Linc: String {
    case rickAndMorty = "https://rickandmortyapi.com/api/character"
}
