//
//  Pokemon.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 27/09/21.
//

import Foundation

struct PokemonList: Decodable {
    let pokemon: [Pokemon]
}

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let num: String
    let name: String
    let img: String
    let type: [String]
    let height: String?
    let width: String?
    let weaknesses: [String]
}
