//
//  GetCardsView.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 01/10/21.
//

import SwiftUI
import Kingfisher

struct GetCardsView: View {
    @State var flipped = false
    @State var showResult: Bool? = false
    @State var sortedNumber: String?
    
    var body: some View {
        ZStack (alignment: .top) {
            Color("lightPurple").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Touch the card to open")
                    .font(.title2)
                    .foregroundColor(Color("darkPurple"))
                    .fontWeight(.bold)
                    .padding(.top)
                
                Spacer()
                
                ZStack {
                    Image("cardIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height * 0.5, alignment: .center)
                        .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                        .animation(.default)
                    
                    if (showResult == false) {
                        Image("pokeball")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("darkPurple"))
                            .scaledToFit()
                            .frame(width: 110, height: 110)
                    } else if (showResult == true && sortedNumber != nil) {
                        KFImage(URL(string: UrlConfig.getPokemonImage(num: sortedNumber!)))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110)
                    }
                }
                .onTapGesture {
                    withAnimation {
                        if (self.flipped == false) {
                            self.showResult = nil
                            self.flipped.toggle()
                            sortedNumber = OwnedCardsHelper.sortCard()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.showResult = true
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct GetCardsView_Previews: PreviewProvider {
    static var previews: some View {
        GetCardsView()
    }
}
