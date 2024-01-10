//
//  Model.swift
//  GameStream
//
//  Created by Antony Huaman Alikhan on 4/01/24.
//

import Foundation

struct Games:Codable {
    var games: [Game]
}


struct Game: Codable, Hashable {
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms: [String]
    var tags: [String]
    var videosUrls:VideoUrl
    var galleryImages:[String]
}

struct VideoUrl : Codable, Hashable {
    var mobile:String
    var tablet:String
}
