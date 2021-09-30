//
//  Pokemon.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 27/09/21.
//

import Foundation

struct Pokemon: Decodable {
    let number: String
    let name: String
    let about: String
    let types: [String]
    let resistants: [String]
    let weaknesses: [String]
    let fastAttacks: [Attack]
    let specialAttacks: [Attack]
    let weight: WeightOrHeight
    let height: WeightOrHeight
    let stamina: String
    let attack: String
    let defense: String
    
    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case name = "Name"
        case about = "About"
        case types = "Types"
        case resistants = "Resistant"
        case weaknesses = "Weaknesses"
        case fastAttacks = "Fast Attack(s)"
        case specialAttacks = "Special Attack(s)"
        case weight = "Weight"
        case height = "Height"
        case stamina = "Base Stamina"
        case attack = "Base Attack"
        case defense = "Base Defense"
    }
}

struct WeightOrHeight: Decodable {
    let minimum: String
    let maximum: String
    
    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

struct Attack: Decodable {
    let name: String
    let type: String
    let damage: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case damage = "Damage"
    }
}
