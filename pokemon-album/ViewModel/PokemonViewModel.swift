//
//  PokemonViewModel.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 27/09/21.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    
    func fetchPokemon(callback: @escaping (Bool) -> Void) {
        if let path = Bundle.main.path(forResource: "pokemon", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                print(data)
                let decodedData = try JSONDecoder().decode([Pokemon].self, from: data)
                pokemon = decodedData
                callback(true)
            } catch {
                print(error)
                callback(false)
            }
        }
    }
}
