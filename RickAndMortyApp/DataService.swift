//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import UIKit

struct Results: Decodable {
    let Character: [Character]
    let Episode: [Episode]
    let Location: [Location]
}

struct Character: Decodable {
    
    var id: Int
    var name: String
//    var status: String
//    var species: String
//    var origin: [String: String]
//    var location: [String: String]
//    var image: String
//    var episode: [String]
    
}

struct Episode: Decodable {
    
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    
}

struct Location: Decodable {
    
    var id: Int
    var name: String
    var type: String
    var residents: [String]
    
}

//    static let shared = DataService()
//    fileprivate var baseURLString = "https://rickandmortyapi.com"


