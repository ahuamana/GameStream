//
//  GamesView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 4/01/24.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantalla games view")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                print("primer elemento del json:")
                print("titulo del primer videojuego:")
            }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
