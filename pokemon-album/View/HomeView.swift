//
//  ContentView.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 27/09/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("lightPurple").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack(alignment: .top) {
                    Image("pokemons2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    
                    Text("Pokédex da Stel")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                
                ScrollView {
                    ForEach(pokemonViewModel.pokemon) { pokemon in
                        HStack {
                            VStack (alignment: .leading) {
                                Text("# \(pokemon.num)")
                                Text(pokemon.name)
                                HStack {
                                    ForEach(0 ..< pokemon.type.count) { index in
                                        Text(pokemon.type[index])
                                            .padding(5)
                                            .background(getTypeColor(value: pokemon.type[index]))
                                            .cornerRadius(15)
                                    }
                                }
                            }
                        }
                        .padding(20)
                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                        .background(getTypeColor(value: pokemon.type.first ?? ""))
                        .cornerRadius(5)
                        .padding(5)
                        .shadow(radius: 4)
                    }
                }
            }
        }
        .onAppear {
            pokemonViewModel.fetchPokemon { isSuccess in
                if(isSuccess == true) {
                    print("Deu bom")
                } else {
                    print("Deu ruim")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
