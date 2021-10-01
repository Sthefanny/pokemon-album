//
//  OwnedCards.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 01/10/21.
//

import Foundation

struct OwnedCard: Encodable, Decodable {
    let number: String
    let quantity: Int
}
