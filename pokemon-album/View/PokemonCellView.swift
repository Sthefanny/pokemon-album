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
        ZStack {
            _buildCardLeft(pokemon: pokemon)
            _buildCardRight(pokemon: pokemon)
        }
    }
    
    func _buildCardLeft(pokemon: Pokemon) -> some View {
        VStack (alignment: .leading) {
            Text("#\(pokemon.num)").font(.system(size: 12, weight: .bold))
                .padding(.bottom, 1)
            Text(pokemon.name).font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            HStack {
                ForEach(0 ..< pokemon.type.count) { index in
                    Text(pokemon.type[index]).font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(5)
                        .background(getTypeColor(value: pokemon.type[index]))
                        .cornerRadius(10)
                        .shadow(radius: 2, x: 0, y: 2)
                }
            }
        }
        .padding(20)
        .frame(width: UIScreen.main.bounds.width - 40, height: 120, alignment: .leading)
        .background(getTypeColor(value: pokemon.type.first ?? "").opacity(0.8))
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
            
            KFImage(URL(string: UrlConfig.getPokemonImage(num: pokemon.num)))
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
        PokemonCellView(pokemon: Pokemon(id: 1, num: "001", name: "Bulbasaur", img: "http://www.serebii.net/pokemongo/pokemon/001.png", type: ["Grass", "Poison"], height: "", width: "", weaknesses: ["Fire"]))
    }
}
