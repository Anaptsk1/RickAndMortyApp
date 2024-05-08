//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import UIKit

struct CharacterResults: Codable {
    var results: [Character]
}

struct LocationResults: Codable {
    var results: [Location]
}

struct EpisodeResults: Codable {
    var results: [Episode]
}

struct Character: Codable {
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var origin: [String: String]
    var location: [String: String]
    var image: String
    var episode: [String]
}

struct Location: Codable {
    
    var id: Int
    var name: String
    var type: String
    var residents: [String]
    
}

struct Episode: Codable {
    
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    
}
