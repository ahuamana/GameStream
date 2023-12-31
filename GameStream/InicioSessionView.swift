//
//  LoginChildView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 30/12/23.
//

import SwiftUI

struct InicioSessionView: View {
    @State var correo = ""
    @State var password = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo Electrónico").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading) {
                    
                    if(correo.isEmpty) {
                        
                        Text(verbatim:"ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo).multilineTextAlignment(.leading)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                //Password
                
                Text("Contraseña").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading) {
                    
                    if(password.isEmpty) {
                        
                        Text(verbatim:"Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $password).multilineTextAlignment(.leading)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("¿Olvidates tu contraseña?").font(.footnote).frame(maxWidth: .infinity, alignment: .trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom, 52)
                
                Button(action: iniciarSession, label: {
                    Text("INICIAR SESSIÓN")
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
                        
                })
                
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white).frame(maxWidth: .infinity).padding(.top, 66)
                
                HStack(alignment: .center) {
                    
                    Button(action: loginWithFacebook, label: {
                        Text("Facebook")
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

func iniciarSession() {
    print("Estoy iniciando session")
}

func loginWithFacebook(){
    print("Estoy iniciando con facebook")
}

func loginWithTwitter(){
    print("Estoy iniciando con Twitter")
}

struct InicioSessionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            InicioSessionView()
        }
    }
}


