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
                            .scaledToFit()
                        
                        
                        HStack (alignment: .top) {
                            Text("PokéAlbum")
                                .font(.title2)
                                .foregroundColor(Color("darkPurple"))
                                .fontWeight(.bold)
                                .padding(.top)
                            Spacer()
                            NavigationLink(destination: GetCardsView()) {
                                Image("cardsIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50, alignment: .leading)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                    
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
                let ownedCards = OwnedCardsHelper.getAllOwnedCards()
                print(ownedCards)
            }
            .navigationBarHidden(true)
        }
        .accentColor(Color("darkPurple"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
