//
//  RegistroView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 29/12/23.
//

import SwiftUI

struct RegistroView: View {
    
    @State var correo = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Elije una foto de perfil")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                    .font(.footnote).padding(.bottom)
                
    
                Button(action: tomarFoto, label: {
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
                })
            
                
                Spacer().frame(height: 48)
                
                // TextFields
                
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
                            
                            Text(verbatim:"Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $password).multilineTextAlignment(.leading).foregroundColor(.white)
                        
                        
                    }
                    
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    
                    //confirm password
                    
                    Text("Confirmar contraseña*").foregroundColor(Color("Dark-Cian"))
                        .fontWeight(.bold)
                    
                    ZStack(alignment: .leading) {
                        
                        if(confirmPassword.isEmpty) {
                            
                            Text(verbatim:"Confirma tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $confirmPassword).multilineTextAlignment(.leading).foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                }
                
                Button(action: registrarse, label: {
                    Text("REGÍSTRATE")
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
                        
                }).padding(.top, 48)
                
                
                Text("Regístrate con redes sociales").foregroundColor(.white).padding(.top, 62)
                
                HStack(alignment: .center) {
                    
                    Button(action: loginWithFacebook, label: {
                        Text("Facebook")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 0.14, green: 0.22, blue: 0.36))
                            .cornerRadius(8)
                            .fontWeight(.bold)
                    })
                    Spacer().frame(width: 10)
                    Button(action: loginWithTwitter, label: {
                        Text("Twitter")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 0.14, green: 0.22, blue: 0.36))
                            .cornerRadius(8)
                            .fontWeight(.bold)
                            

                        
                    })
                }.frame(maxWidth: .infinity)
                
            }
        }
        
        
    }
}

func registrarse() {
    
}

func tomarFoto() {
    
}

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            RegistroView()
        }
        
    }
}
