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
                    Image("pokemons")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    
                    Text("Pokédex da Stel")
                        .font(.title2)
                        .foregroundColor(Color("darkPurple"))
                        .fontWeight(.bold)
                        .padding(.top)
                        .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .center)
                
                ScrollView {
                    ForEach(pokemonViewModel.pokemon) { pokemon in
                        LazyVStack {
                            PokemonCellView(pokemon: pokemon)
                        }
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
