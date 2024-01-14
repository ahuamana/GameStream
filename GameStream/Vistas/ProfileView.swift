//
//  ProfileView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 13/01/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Lorem"
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1).ignoresSafeArea()
            
            VStack {
                
                Text("Perfil")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                VStack {
                    
                    Image("picture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ModuloAjustes()
            }
            
            
        }.onAppear {
            //print datos de usuario
        }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ModuloAjustes : View {
    
    @State var isToggleOn = true
    @State var isEditPRofileViewActive = true
    
    var body: some View {
        VStack(spacing: 3) {
            Button(action: {
                
            }) {
                HStack {
                    Text("Cuenta")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right") .foregroundColor(.white)
                    
                }.padding()
                
            }.background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button(action: {
                
            }) {
                HStack {
                    Text("Notificaciones")
                        .foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                    
                }.padding()
                
            }.background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button(action: {
                
            }) {
                HStack {
                    Text("Editar Perfil")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right") .foregroundColor(.white)
                    
                }.padding()
                
            }.background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Button(action: {
                
            }) {
                HStack {
                    Text("Califica esta aplicación")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right") .foregroundColor(.white)
                    
                }.padding()
                
            }.background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 1))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
