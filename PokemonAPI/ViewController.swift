//
//  ViewController.swift
//  PokemonAPI
//
//  Created by Angelina Olmedo on 4/20/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokemons: [Pokemon] = [] {
           didSet {
               pokemonTableView.reloadData()
           }
        }
        var networkManager = NetworkManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            pokemonTableView.dataSource = self
            pokemonTableView.delegate = self
            updatePokemon()
        }
        
        func updatePokemon() {
           networkManager.getPokemons() { result in
               self.pokemons = result
           }
        }
    }

    // MARK: UITableViewDataSource
    extension ViewController: UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        let pokemon = pokemons[indexPath.row]
//        cell.pokemon = pokemon
//        return cell
       }
    }

    // MARK: UITableViewDelegate
    extension ViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        }
    }
