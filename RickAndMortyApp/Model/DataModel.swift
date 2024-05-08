//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import UIKit

//struct Results: Decodable {
//    let Character: [Character]
//    let Episode: [Episode]
//    let Location: [Location]
//}

struct Character: Decodable {
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var origin: [String: String]
//    var location: [String: String]
//    var image: String
//    var episode: [String]
    
//    enum CodingKeys: String, CodingKey, RawRepresentable {
//        case id, name = ""
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encodeIfPresent(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//    }
//    
//    
//}
//
//extension Character: Decodable {
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//    }
//    
}

//struct Episode: Decodable {
//    
//    var id: Int
//    var name: String
//    var air_date: String
//    var episode: String
//    var characters: [String]
//    
//}

//struct Location: Decodable {
//    
//    var id: Int
//    var name: String
//    var type: String
//    var residents: [String]
//    
//}

//    static let shared = DataService()
//    fileprivate var baseURLString = "https://rickandmortyapi.com"


