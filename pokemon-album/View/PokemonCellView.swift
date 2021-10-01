//
//  PokemonCellView.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 28/09/21.
//

import SwiftUI
import Kingfisher

struct PokemonCellView: View {
    @State var pokemon: Pokemon
    
    var body: some View {
        NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
            ZStack {
                _buildCardLeft(pokemon: pokemon)
                _buildCardRight(pokemon: pokemon)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    func _buildCardLeft(pokemon: Pokemon) -> some View {
        VStack (alignment: .leading) {
            Text("#\(pokemon.number)").font(.system(size: 12, weight: .bold))
                .padding(.bottom, 1)
            Text(pokemon.name).font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            HStack {
                ForEach(0 ..< pokemon.types.count) { index in
                    Text(pokemon.types[index]).font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 8)
                        .background(getTypeColor(value: pokemon.types[index]))
                        .cornerRadius(10)
                        .shadow(radius: 2, x: 0, y: 2)
                }
            }
        }
        .padding(20)
        .frame(width: UIScreen.main.bounds.width - 40, height: 120, alignment: .leading)
        .background(getTypeColor(value: pokemon.types.first ?? "").opacity(0.8))
        .cornerRadius(5)
        .padding(5)
        .padding(.top)
        .shadow(radius: 2, x: 0, y: 2)
    }
    
    func _buildCardRight(pokemon: Pokemon) -> some View {
        ZStack {
            Image("pokeball")
                .resizable()
                .scaledToFit()
                .opacity(0.1)
                .frame(width: 110, height: 110)
            
            KFImage(URL(string: UrlConfig.getPokemonImage(num: pokemon.number)))
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110)
                .offset(x: -5, y: -20)
        }
        .offset(x: 128, y: 0)
    }
}

struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView(pokemon: Pokemon(number: "001", name: "Bulbasaur", about: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.", types: ["Grass", "Poison"], resistants: ["Water"], weaknesses: ["Fire"], fastAttacks: [Attack(name: "Tackle", type: "Normal", damage: 12)], specialAttacks: [Attack(name: "Power Whip", type: "Grass", damage: 70)], weight: WeightOrHeight(minimum: "6.04kg", maximum: "7.76kg"), height: WeightOrHeight(minimum: "0.61m", maximum: "0.79m"), stamina: "90 stamina points.", attack: "118 attack points.", defense: "118 defense points."))
    }
}
