//
//  Pokemon.swift
//  PokemonAPI
//
//  Created by Angelina Olmedo on 4/20/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation

struct Pokemon {
    let name: String
    let url: String
}

struct PokemonList: Decodable {
   var pokemons: [Pokemon]
}

// MARK: Decodable
extension Pokemon: Decodable {
    enum PokemonKeys: String, CodingKey {
        case name
        case url
    }
    
    init(from decoder: Decoder) throws {
        let pokemonsContainer = try decoder.container(keyedBy: PokemonKeys.self)
        name = try pokemonsContainer.decode(String.self, forKey: .name)
        url = try pokemonsContainer.decode(String.self, forKey: .url)
    }
}
