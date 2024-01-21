//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 29/12/23.
//

import SwiftUI

@main
struct GameStreamApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        //()Punto de partida de mi app
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            print(phase) //active -inactive -background
        }
    }
}
