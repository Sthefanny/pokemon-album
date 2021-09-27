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
        return .normal;
    case "Fire":
        return .fire;
    case "Fighting":
        return .fighting;
    case "Water":
        return .water;
    case "Flying":
        return .flying;
    case "Grass":
        return .grass;
    case "Poison":
        return .poison;
    case "Electric":
        return .electric;
    case "Ground":
        return .ground;
    case "Psychic":
        return .psychic;
    case "Rock":
        return .rock;
    case "Ice":
        return .ice;
    case "Bug":
        return .bug;
    case "Ghost":
        return .ghost;
    case "Dark":
        return .dark;
    case "Steel":
        return .steel;
    case "Fairy":
        return .fairy;
    default:
        return .undefined;
    }
}

func getTypeColor(value: String) -> Color {
    switch value {
    case "Normal":
    return Color("Normal");
    case "Fire":
    return Color("Fire");
    case "Fighting":
    return Color("Fighting");
    case "Water":
    return Color("Water");
    case "Flying":
    return Color("Flying");
    case "Grass":
    return Color("Grass");
    case "Poison":
    return Color("Poison");
    case "Electric":
    return Color("Electric");
    case "Ground":
    return Color("Ground");
    case "Psychic":
    return Color("Psychic");
    case "Rock":
    return Color("Rock");
    case "Ice":
    return Color("Ice");
    case "Bug":
    return Color("Bug");
    case "Ghost":
    return Color("Ghost");
    case "Dark":
    return Color("Dark");
    case "Steel":
    return Color("Steel");
    case "Fairy":
    return Color("Fairy");
    default:
    return Color("Undefined");
    }
}
