//
//  FavoritesView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 12/01/24.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1).ignoresSafeArea()
            
            VStack {
                
                Text("FAVORITOS")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                ScrollView {
                    
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self) { juego in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 300)
                            
                            Text(juego.title)
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                        
                        
                        
                    }
                    
                }.padding(.bottom, 8)
                
                
                
            
            }.padding(.horizontal, 6)
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
