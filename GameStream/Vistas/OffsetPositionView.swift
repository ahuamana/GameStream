//
//  OffsetPositionView.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 20/01/24.
//

import SwiftUI

struct OffsetPositionView: View {
    var body: some View {
        VStack {
            Offsets()
        }
    }
}

struct Positions : View {
    var body: some View {
        VStack{
            Image("picture")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .position(x:14, y:100)
        }
    }
}

struct Offsets:View {
    var body: some View {
        Image("picture")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height:200)
            .offset(x:15,y:-100)
        Text("Platzi")
    }
}

struct OffsetPositionView_Previews: PreviewProvider {
    static var previews: some View {
        Positions()//OffsetPositionView()
    }
}
