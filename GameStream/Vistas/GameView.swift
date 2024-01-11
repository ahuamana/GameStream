//
//  GameView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 8/01/24.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    var imgsUrl: [String]
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1).ignoresSafeArea()
            
           
            
            VStack {
                video(url:url).frame(height:300)
                
                ScrollView {
                    //Informacion video
                    videoInfo(titulo:titulo, studio:studio, calificacion:calificacion, anoPublicacion:anoPublicacion, descripcion:descripcion, tags:tags).padding(.bottom)
                    
                    //Gallery Info
                    Gallery(imgsGallery: imgsUrl)
                    
                    //Comentarios
                    CommentsView()
                    
                    //Juegos Similares
                    JuegosSimilares()
                    
                }.frame(maxWidth: .infinity)
            }
        }
        
    }
}

struct JuegosSimilares : View {
    
    //var urlVideos: [String]
    
    var body : some View {
        
        VStack {
            //Categorias recomendados
            Text("VIDEOS QUE PODRIAN GUSTARTE")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    Button(action: {
                       
                        //print("url: \(url)")
                    }, label: {
                        Image("image 25")
                            .resizable()
                            .frame(width: 227, height: 128)
                        .cornerRadius(8)})
                    
                    Button(action: {
                        
                        //print("url: \(url)")
                    }, label: {
                        Image("image 26")
                            .resizable()
                            .frame(width: 227, height: 128)
                        .cornerRadius(8)})
                    
                    Button(action: {
                        
                        //print("url: \(url)")
                    }, label: {
                        Image("image 27")
                            .resizable()
                            .frame(width: 227, height: 128)
                        .cornerRadius(8)})
                    
                    
                }
            }
        }
    }
}

struct CommentsView:View {
    var body: some View {
        VStack() {
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding(.leading)
            
            VStack {
                //Comentario
                CommentItem(name:"Geoff Atto", daysRemaining: "Hace 7 Días", description:"He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                    .padding(.horizontal, 10)
                
                CommentItem(name:"Alvy Baack", daysRemaining: "Hace 12 días", description:"He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                    .padding(.horizontal, 10)
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery: View {
    var imgsGallery:[String]
    
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding(.leading)
                
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid, spacing: 8) {
                    ForEach(imgsGallery, id:\.self) { url in
                        //Desplegar imagenes del servidors
                        
                        KFImage(URL(string: url))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct videoInfo:View {
    //var url:String
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    //var imgsUrl: [String]
    
    var body : some View {
        VStack(alignment: .leading) {
            Text(titulo)
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack {
                Text(studio)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text(calificacion)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text(anoPublicacion)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            
            Text(descripcion)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack {
                ForEach(tags, id:\.self) { tag in
                    Text("# \(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
                
            
        }.frame(maxWidth: .infinity, alignment: .center)
    }
}

struct video:View {
    var url:String
    var body:some View {
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog"
            ,studio:"Sega"
            ,calificacion:"E+"
            ,anoPublicacion:"1991"
            ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
            ,tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}

struct CommentItem : View {
    
    var name:String
    var daysRemaining:String
    var description:String
    
    var body: some View {
        VStack {
            HStack(){
                
                Spacer()
                    .frame(width: 14)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 35, height: 35)
                    .background(
                        Image("picture")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .clipped()
                            .cornerRadius(35)
                    )
                
                Spacer()
                    .frame(width: 18)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .bold()
                        .foregroundColor(.white)
                    Text(daysRemaining)
                        .bold()
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
            
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 14)
            
            
            VStack {
                Text("\(description)")
                    .foregroundColor(.white)
                    .padding(.all, 0)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 14)
           
                
        }
        .frame(maxWidth: .infinity)
        .background(Color("Blue-Gray"))
        .cornerRadius(8)
        .padding(.bottom, 10)
    }
}


struct CommentItem_Preview : PreviewProvider {
    static var previews: some View {
        CommentItem(name:"Geoff Atto", daysRemaining: "Hace 7 Días", description:"He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
    }
}
