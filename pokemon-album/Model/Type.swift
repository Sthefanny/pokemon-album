//
//  Type.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 27/09/21.
//

import Foundation
import SwiftUI

enum Type {
    case normal
    case fighting
    case grass
    case poison
    case fire
    case ice
    case flying
    case psychic
    case water
    case ground
    case rock
    case electric
    case bug
    case ghost
    case dark
    case steel
    case fairy
    case undefined
}

func getType(value: String) -> Type {
    switch value {
    case "Normal":
        return .normal
    case "Fire":
        return .fire
    case "Fighting":
        return .fighting
    case "Water":
        return .water
    case "Flying":
        return .flying
    case "Grass":
        return .grass
    case "Poison":
        return .poison
    case "Electric":
        return .electric
    case "Ground":
        return .ground
    case "Psychic":
        return .psychic
    case "Rock":
        return .rock
    case "Ice":
        return .ice
    case "Bug":
        return .bug
    case "Ghost":
        return .ghost
    case "Dark":
        return .dark
    case "Steel":
        return .steel
    case "Fairy":
        return .fairy
    default:
        return .undefined
    }
}

func getTypeColor(value: String) -> Color {
    var color: Color = Color("Undefined")
    switch value {
    case "Normal":
        color = Color("Normal")
        break
    case "Fire":
        color = Color("Fire")
        break
    case "Fighting":
        color = Color("Fighting")
        break
    case "Water":
        color = Color("Water")
        break
    case "Flying":
        color = Color("Flying")
        break
    case "Grass":
        color = Color("Grass")
        break
    case "Poison":
        color = Color("Poison")
        break
    case "Electric":
        color = Color("Electric")
        break
    case "Ground":
        color = Color("Ground")
        break
    case "Psychic":
        color = Color("Psychic")
        break
    case "Rock":
        color = Color("Rock")
        break
    case "Ice":
        color = Color("Ice")
        break
    case "Bug":
        color = Color("Bug")
        break
    case "Ghost":
        color = Color("Ghost")
        break
    case "Dark":
        color = Color("Dark")
        break
    case "Steel":
        color = Color("Steel")
        break
    case "Fairy":
        color = Color("Fairy")
        break
    default:
        color = Color("Undefined")
        break
    }
    return color
}
