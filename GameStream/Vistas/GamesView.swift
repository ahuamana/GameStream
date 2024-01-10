//
//  GamesView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 4/01/24.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    @State var gameviewIsActive:Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1).ignoresSafeArea()
            
            VStack {
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView (){
                    LazyVGrid(columns:formaGrid, spacing: 8) {
                        ForEach(todosLosVideoJuegos.gamesInfo, id: \.self) {
                            juego in
                            
                            Button(action: {
                                url = juego.videosUrls.mobile
                                self.titulo = juego.title
                                studio = juego.studio
                                calificacion = juego.contentRaiting
                                anoPublicacion = juego.publicationYear
                                
                                descripcion = juego.description
                                tags = juego.tags
                                imgsUrl = juego.galleryImages
                                
                                print("Pulse el juego \(titulo)")
                                
                                self.gameviewIsActive = true
                                
                            }, label: {
                                
                                
                                KFImage(URL(string: juego.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                    .padding(.bottom, 12)
                                
                                
                            })
                        }
                    }
                }
                
            }.padding(.horizontal,6)
            
                
                .navigationDestination(isPresented: $gameviewIsActive, destination: {
                    GameView(url: self.url, titulo: self.titulo, studio: self.studio, calificacion: self.anoPublicacion, anoPublicacion: self.anoPublicacion, descripcion: self.descripcion, tags: self.tags, imgsUrl: self.imgsUrl)
                })
            
        }
        
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
                print("primer elemento del json: \(todosLosVideoJuegos.gamesInfo.count)")
                
                if let firstGame = todosLosVideoJuegos.gamesInfo.first {
                    print("titulo del primer videojuegos: \(firstGame)")
                }
                
            }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
