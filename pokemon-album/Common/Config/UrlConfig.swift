//
//  UrlConfig.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 27/09/21.
//

import Foundation

class UrlConfig {
    static func getPokemonImage(num: String) -> String {
        return "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/\(num).png"
    }
    
    static func getPokemonDetails(id: Int) -> String {
        return "https://pokeapi.co/api/v2/pokemon-species/\(id)"
    }
}
