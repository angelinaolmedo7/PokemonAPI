//
//  PokemonTableViewCell.swift
//  PokemonAPI
//
//  Created by Angelina Olmedo on 4/20/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var URLLabel: UILabel!
    
    var pokemon: Pokemon? {
        didSet {
            guard let pokemon = pokemon else { return }
            // Assign our UI elements to their post counterparts
            NameLabel.text = pokemon.name
            URLLabel.text = pokemon.url
       }
    }
}
