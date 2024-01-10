//
//  ViewModel.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 4/01/24.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    init() {
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    print("tamaño del Json \(jsonData)")
                    
                    let decodeData = try JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
                    
            } catch {
                print("Error> \(error)")
            }
        }.resume()
        
    }
    
}
