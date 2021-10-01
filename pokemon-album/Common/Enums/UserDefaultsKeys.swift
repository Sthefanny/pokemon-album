//
//  UserDefaultsKeys.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 01/10/21.
//

import Foundation

enum UserDefaultsKeys: String {
    case ownedCards = "idUsuario"

    var name: String {
        return self.rawValue
    }
}
