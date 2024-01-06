//
//  LoginView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 29/12/23.
//

import SwiftUI

enum TipoInicioSession {
    case inicioSession
    case registroSession
}

struct LoginView: View {
    
    @State var tipoInicioSession : TipoInicioSession = .inicioSession
    
    var body: some View {
        VStack {
            HStack {
                
                
                Button("INICIA SESIÓN") {
                    tipoInicioSession = .inicioSession
                }.foregroundColor(
                    self.tipoInicioSession == .inicioSession ? .white : .gray
                )
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    tipoInicioSession = .registroSession
                }.foregroundColor( self.tipoInicioSession == .inicioSession ? .gray : .white)
            
            }
            
            Spacer(minLength: 42)
            
            switch tipoInicioSession {
            case .inicioSession:  InicioSessionView()
            case .registroSession: RegistroView()
                
            }
            

        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1).ignoresSafeArea()
            LoginView()
        }
    }
}
