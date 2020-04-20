//
//  NetworkManager.swift
//  PokemonAPI
//
//  Created by Angelina Olmedo on 4/20/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation

class NetworkManager {
    // shared singleton session object used to run tasks. Will be useful later
    let urlSession = URLSession.shared

    var baseURL = "https://pokeapi.co/api/v2/"
    
    func getPokemons(completion: @escaping ([Pokemon]) -> Void) {
        let query = "pokemon"
        let fullURL = URL(string: baseURL + query)!
        var request = URLRequest(url: fullURL)
        
        request.httpMethod = "GET"
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                return
            }
            guard let result = try? JSONDecoder().decode(PokemonList.self, from: data) else {
                return
            }
            let pokemons = result.pokemons

            DispatchQueue.main.async {
                completion(pokemons)
            }
        }
        task.resume()
    }
}
