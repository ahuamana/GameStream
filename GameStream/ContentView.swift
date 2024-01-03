//
//  ContentView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToHome = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 1).ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 185).padding(.bottom, 54)
                    LoginView()
                
                }.padding(.horizontal, 25)
            
            }
        }.navigationBarHidden(true)
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
