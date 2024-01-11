//
//  SearchGame.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 11/01/24.
//

import Foundation


class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func search(gameName:String) {
        
        gameInfo.removeAll()
        
        let gameNamesSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNamesSpaces ?? "cuphead")")!
        
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    print("tamaño del Json \(jsonData)")
                    
                    let decodeData = try JSONDecoder().decode(Resultados.self, from: jsonData)
                    
                    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
                    
            } catch {
                print("Error> \(error)")
            }
        }.resume()
    }
}
