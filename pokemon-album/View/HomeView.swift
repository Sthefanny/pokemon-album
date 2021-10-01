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
        NavigationView {
            ZStack(alignment: .top) {
                Color("lightPurple").edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack(alignment: .top) {
                        Image("pokemons")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        
                        Text("Album Pokémon")
                            .font(.title2)
                            .foregroundColor(Color("darkPurple"))
                            .fontWeight(.bold)
                            .padding(.top)
                            .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    
                    if (pokemonViewModel.pokemon.count > 0) {
                        ScrollView {
                            ForEach(0 ..< pokemonViewModel.pokemon.count) { index in
                                LazyVStack {
                                    PokemonCellView(pokemon: pokemonViewModel.pokemon[index])
                                }
                            }
                        }
                    } else {
                        LoadingView()
                    }
                }
            }
            .onAppear {
                pokemonViewModel.fetchPokemon { _ in }
            }
            .navigationBarHidden(true)
        }
        .accentColor( .white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
