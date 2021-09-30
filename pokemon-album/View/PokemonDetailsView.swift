//
//  PokemonDetailsView.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 30/09/21.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsView: View {
    @State var pokemon: Pokemon
    
    var body: some View {
        ZStack {
//            background(getTypeColor(value: pokemon.type.first ?? "").opacity(0.8))
            Color("Grass").edgesIgnoringSafeArea(.all)
            
            VStack {
                _buildPokemonData()
                Spacer()
                _buildPokemonDetails()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func _buildPokemonData() -> some View {
        HStack {
            KFImage(URL(string: UrlConfig.getPokemonImage(num: pokemon.number)))
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110)
                .padding(.trailing, 30)
            
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
        }
        .padding(.top, 50)
    }
    
    func _buildPokemonDetails() -> some View {
        VStack {
            Text("Bio: \(pokemon.about)")
        }
        .padding(30)
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6, alignment: .topLeading)
        .background(RoundedRectangle(cornerRadius: 40))
        .foregroundColor(.white)
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: Pokemon(number: "001", name: "Bulbasaur", about: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.", types: ["Grass", "Poison"], resistants: ["Water"], weaknesses: ["Fire"], fastAttacks: [Attack(name: "Tackle", type: "Normal", damage: 12)], specialAttacks: [Attack(name: "Power Whip", type: "Grass", damage: 70)], weight: WeightOrHeight(minimum: "6.04kg", maximum: "7.76kg"), height: WeightOrHeight(minimum: "0.61m", maximum: "0.79m"), stamina: "90 stamina points.", attack: "118 attack points.", defense: "118 defense points."))
    }
}
