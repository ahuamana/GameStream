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
            }
            
            
        }
    }
}

struct InicioSessionView_Previews: PreviewProvider {
    static var previews: some View {
        InicioSessionView()
    }
}
