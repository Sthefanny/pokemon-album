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
        VStack (alignment: .leading) {
            HStack {
                Spacer()
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
                Spacer()
            }
            .padding(.top, 50)
            .padding(.bottom, 20)
            
            _buildWeaknesses
            _buildResistants
        }
        .padding(.horizontal, 20)
    }
    
    func _buildPokemonDetails() -> some View {
        VStack (alignment: .leading) {
            ScrollView {
                _buildBio
                VStack (alignment: .leading) {
                    _buildPokedexTitle
                    _buildAvgWeight
                    _buildAvgHeight
                    _buildQuickMovesTitle
                    _buildQuickMoves
                    _buildSpecialMovesTitle
                    _buildSpecialMoves
                }
                .frame(width: UIScreen.main.bounds.width - 60, alignment: .topLeading)
            }
            .frame(width: UIScreen.main.bounds.width - 60, alignment: .topLeading)
        }
        .padding(30)
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.65, alignment: .topLeading)
        .background(RoundedRectangle(cornerRadius: 40))
        .foregroundColor(.white)
    }
    
    var _buildBio: some View {
        VStack (alignment: .leading) {
            Text("Pokémon Bio")
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(nil)
                .foregroundColor(getTypeColor(value: pokemon.types.first ?? ""))
                .padding(.bottom, 10)
            Text(pokemon.about)
                .padding(.leading, 10)
        }
        .frame(width: UIScreen.main.bounds.width - 60, alignment: .topLeading)
    }
    
    var _buildPokedexTitle: some View {
        Text("Pokédex Data")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(getTypeColor(value: pokemon.types.first ?? ""))
            .padding(.vertical, 10)
    }
    
    var _buildAvgWeight: some View {
        HStack {
            Text("Avg. Weight:")
                .font(.body)
                .fontWeight(.bold)
            Text("\(pokemon.weight.minimum)")
                .font(.body)
            Text("-")
                .font(.body)
            Text("\(pokemon.weight.minimum)")
                .font(.body)
        }
        .padding(.bottom, 8)
        .padding(.leading, 10)
    }
    
    var _buildAvgHeight: some View {
        HStack {
            Text("Avg. Height:")
                .font(.body)
                .fontWeight(.bold)
            Text("\(pokemon.height.minimum)")
                .font(.body)
            Text("-")
                .font(.body)
            Text("\(pokemon.height.minimum)")
                .font(.body)
        }
        .padding(.bottom, 8)
        .padding(.leading, 10)
    }
    
    var _buildWeaknesses: some View {
        HStack {
            Text("Weaknesses:")
                .font(.body)
                .fontWeight(.bold)
            
            ForEach(0 ..< pokemon.weaknesses.count) { index in
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(getTypeColor(value: pokemon.weaknesses[index]))
                    Image(pokemon.weaknesses[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                }
            }
            
        }
        .padding(.bottom, 8)
    }
    
    var _buildResistants: some View {
        HStack {
            Text("Resistant to:")
                .font(.body)
                .fontWeight(.bold)
            
            ForEach(0 ..< pokemon.resistants.count) { index in
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(getTypeColor(value: pokemon.resistants[index]))
                    Image(pokemon.resistants[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.bottom, 8)
    }
    
    var _buildQuickMovesTitle: some View {
        Text("Quick Moves")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(getTypeColor(value: pokemon.types.first ?? ""))
            .padding(.vertical, 10)
    }
    
    var _buildQuickMoves: some View {
        VStack (alignment: .leading) {
            ForEach(0 ..< pokemon.fastAttacks.count) { index in
                HStack {
                    Text(pokemon.fastAttacks[index].type).font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 8)
                        .background(getTypeColor(value: pokemon.fastAttacks[index].type))
                        .cornerRadius(10)
                        .shadow(radius: 2, x: 0, y: 2)
                    Text(pokemon.fastAttacks[index].name)
                        .font(.body)
                    Text("(\(pokemon.fastAttacks[index].damage) damage)")
                        .font(.system(size: 13))
                }
                .padding(.bottom, 2)
            }
        }
        .padding(.bottom, 8)
        .padding(.leading, 10)
    }
    
    var _buildSpecialMovesTitle: some View {
        Text("Special Moves")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(getTypeColor(value: pokemon.types.first ?? ""))
            .padding(.vertical, 10)
    }
    
    var _buildSpecialMoves: some View {
        VStack (alignment: .leading) {
            ForEach(0 ..< pokemon.specialAttacks.count) { index in
                HStack {
                    Text(pokemon.specialAttacks[index].type).font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 8)
                        .background(getTypeColor(value: pokemon.specialAttacks[index].type))
                        .cornerRadius(10)
                        .shadow(radius: 2, x: 0, y: 2)
                    Text(pokemon.specialAttacks[index].name)
                        .font(.body)
                    Text("(\(pokemon.specialAttacks[index].damage) damage)")
                        .font(.system(size: 13))
                }
                .padding(.bottom, 2)
            }
        }
        .padding(.bottom, 8)
        .padding(.leading, 10)
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: Pokemon(number: "001", name: "Bulbasaur", about: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.", types: ["Grass", "Poison"], resistants: ["Water", "Electric", "Grass", "Fighting", "Fairy"], weaknesses: ["Fire", "Ice", "Flying", "Psychic"], fastAttacks: [Attack(name: "Tackle", type: "Normal", damage: 12), Attack(name: "Vine Whip", type: "Grass", damage: 7)], specialAttacks: [Attack(name: "Power Whip", type: "Grass", damage: 70), Attack(name: "Seed Bomb", type: "Grass", damage: 40), Attack(name: "Sludge Bomb", type: "Poison", damage: 55)], weight: WeightOrHeight(minimum: "6.04kg", maximum: "7.76kg"), height: WeightOrHeight(minimum: "0.61m", maximum: "0.79m"), stamina: "90 stamina points.", attack: "118 attack points.", defense: "118 defense points."))
    }
}
