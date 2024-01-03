//
//  Home.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 30/12/23.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var tabSeleccionado: Int = 2
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-Color"))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        TabView(selection: $tabSeleccionado) {
            
            Text("Perfil")
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil") }
                .tag(0)
            
            Text("Pantalla Juegos")
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos") }
                .tag(1)
            
            HomeChild()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")}
                .tag(2)
            
            Text("Pantalla Favoritos")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")}
                .tag(3)
        }.accentColor(.white)
    }
}


struct HomeChild : View {
    
    @State var textoBusqueda = ""
    
    var body : some View {
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack() {
               
                //Header
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                
                Spacer().frame(height: 28)
                
                // Componente buscar
                HStack {
                    Button(action: busqueda, label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .foregroundColor(textoBusqueda.isEmpty ? .yellow : Color("Dark-Cian"))
                            .frame(width: 25, height: 25)
                            .aspectRatio(contentMode: .fit)
                    })
                    
                    ZStack(alignment: .leading) {
                        
                        if textoBusqueda.isEmpty {
                            Text ("Buscar un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/225, opacity:1))
                                .font(.system(size: 14))
                        }
                        
                        TextField("", text: $textoBusqueda).foregroundColor(.white)
                            .font(.system(size: 14))
                        
                    }
                }.padding([.bottom, .top, .leading], 11)
                    .background(Color("Blue-Gray"))
                    .clipShape(Capsule())
                
                //Body
                SubModuleHome()
                
            }.padding(.horizontal, 18).frame(maxHeight: .infinity, alignment: .top)
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func busqueda() {
        print("El usuurio esta buscando \(textoBusqueda)")
    }
}

struct SubModuleHome : View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
        
        
    var body : some View {
        VStack {
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack {
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL \(url)")
                    isPlayerActive = true
                    
                }, label: {
                    VStack(spacing: 0) {
                        Image("image 20")
                            .resizable()
                            .scaledToFit()
                        Text("Uncharted 4")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.top, .bottom], 6)
                            .background(Color("Blue-Gray"))
                    }
                })
                
                //circle
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
            }.frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
            
            
                .navigationDestination(isPresented: $isPlayerActive) {
                    VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                }
            
        }
        
        
        
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
