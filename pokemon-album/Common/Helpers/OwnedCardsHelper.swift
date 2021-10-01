//
//  OwnedCardsHelper.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 01/10/21.
//

import Foundation
import SwiftUI

class OwnedCardsHelper {
    static func saveOwnedCard(number: String) {
        var ownedCards: [OwnedCard]? = getAllOwnedCards()
        let lastOwnedCards = getOwnedCardsByNumber(number: number)
        if (ownedCards == nil) {
            ownedCards = [OwnedCard]()
        }
        
        let newOwnedCard = OwnedCard(number: number, quantity: lastOwnedCards != nil ? lastOwnedCards!.quantity + 1 : 1)
        ownedCards!.append(newOwnedCard)
        
        do {
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(ownedCards)
            
            UserDefaults.standard.set(data, forKey: UserDefaultsKeys.ownedCards.name)
            
        } catch {
            print("Unable to Encode Array of Owned Cards (\(error))")
        }
    }
    
    static func getAllOwnedCards() -> [OwnedCard]? {
        var allOwnedCards: [OwnedCard]?
        
        if let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.ownedCards.name) {
            do {
                let decoder = JSONDecoder()
                
                allOwnedCards = try decoder.decode([OwnedCard].self, from: data)
                
            } catch {
                print("Unable to Decode Owned Cards (\(error))")
            }
        }
        
        return allOwnedCards
    }
    
    static func getOwnedCardsByNumber(number: String) -> OwnedCard? {
        let ownedCards = getAllOwnedCards()
        if (ownedCards == nil) {
            return nil
        }
        
        return ownedCards!.first(where: { card in
            card.number == number
        })
    }
    
    static func cleanOwnedCardsByNumber(number: String) {
        var ownedCards = getAllOwnedCards()
        let lastOwnedCards = getOwnedCardsByNumber(number: number)
        
        if (lastOwnedCards != nil) {
            ownedCards?.removeAll(where: { card in
                card.number == number
            })
            
            do {
                let encoder = JSONEncoder()
                
                let data = try encoder.encode(ownedCards)
                
                UserDefaults.standard.set(data, forKey: UserDefaultsKeys.ownedCards.name)
                
            } catch {
                print("Unable to Encode Array of Owned Cards (\(error))")
            }
        }
    }
    
    static func getColor(number: String, type: String, withOpacity: Bool = false) -> Color {
        return withOpacity == true ? getTypeColor(value: type).opacity(0.8) : getTypeColor(value: type)
//        if (getOwnedCardsByNumber(number: number) != nil) {
//            return withOpacity == true ? getTypeColor(value: type).opacity(0.8) : getTypeColor(value: type)
//        } else {
//            return Color.gray
//        }
    }
    
    static func sortCard() -> String {
        let pokemonCount = 1 ..< 152
        let sorted = pokemonCount.randomElement()
        
        let result = String(format: "%03d", sorted!)
        
        saveOwnedCard(number: result)
        
        return result
    }
}
