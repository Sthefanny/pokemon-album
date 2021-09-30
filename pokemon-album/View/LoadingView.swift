//
//  LoadingView.swift
//  pokemon-album
//
//  Created by Sthefanny Gonzaga on 30/09/21.
//

import SwiftUI

struct LoadingView: View {
    
    @State var animate = false
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack(alignment: .center){
                    HStack {}.frame(width: screenWidth.magnitude, height: 2, alignment: .center)
                    Spacer()
                    Image("pokeball")
                        .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                    Spacer()
                    
                }
                .onAppear {
                    self.animate.toggle()
                }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
