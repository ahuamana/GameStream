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
    @State var isEditPRofileViewActive = false
    
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
                isEditPRofileViewActive = true
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
        
        .navigationDestination(isPresented: $isEditPRofileViewActive) {
            EditProfileView()
        }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct EditProfileView: View {
    
    @State var tomarFoto = false

    @State var correo = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1).ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    HStack{
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
    
                        
                        Text("Editar Perfil")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()

                    }.padding(.horizontal)
                    
                    Button(action: {
                        //TODO: tomar foto
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 85, height: 85)
                                .background(.black.opacity(0.25))
                                .background(
                                    Image("picture")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 85, height: 85)
                                        .clipped()
                                ).cornerRadius(85)
                            
                            
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    }).padding(.top, 40)
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("Correo Electrónico").foregroundColor(Color("Dark-Cian"))
                            .fontWeight(.bold)
                        
                        ZStack(alignment: .leading) {
                            
                            if(correo.isEmpty) {
                                
                                Text(verbatim:"ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                            }
                            
                            TextField("", text: $correo).multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                        }
                        
                        Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                        
                        //Password
                        
                        Text("Contraseña*").foregroundColor(Color("Dark-Cian"))
                            .fontWeight(.bold)
                        
                        ZStack(alignment: .leading) {
                            
                            if(password.isEmpty) {
                                
                                Text(verbatim:"Introduce tu nueva contraseña").font(.caption).foregroundColor(.gray)
                            }
                            
                            SecureField("", text: $password).multilineTextAlignment(.leading).foregroundColor(.white)
                            
                            
                        }
                        
                        Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                        
                        //confirm password
                        
                        Text("Nombre").foregroundColor(Color("Dark-Cian"))
                            .fontWeight(.bold)
                        
                        ZStack(alignment: .leading) {
                            
                            if(confirmPassword.isEmpty) {
                                
                                Text(verbatim:"Introduce tu nombre de usuario").font(.caption).foregroundColor(.gray)
                            }
                            
                            SecureField("", text: $confirmPassword).multilineTextAlignment(.leading).foregroundColor(.white)
                        }
                        
                        Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    }.padding(.horizontal)
                    
                    Button(action: actualizarDatos, label: {
                        Text("ACTUALIZAR DATOS")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top:15, leading: 18, bottom: 11, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .inset(by: 0.5)
                                    .stroke(Color("Dark-Cian"), lineWidth: 1)
                                    .shadow(color: .white, radius: 6)
                            )
                            
                    }).padding([.top,.horizontal])
                    
                    
                }.padding(.bottom)
            }
        }
    }
}

func actualizarDatos() {
    print("Actualizando datos")
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
