//
//  LocationsViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import UIKit

class Location: Codable {
    
    var id: Int
    var name: String
    var type: String
    var residents: [String]
    
    func fetchLocation (completion: @escaping (Result<[Location], Error>) -> Void) {
        
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "rickandmortyapi.com"
        componentURL.path = "/api/character"
        
        guard let validURL = componentURL.url else {
            print("URL creation failed...")
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API Status: \(httpResponse.statusCode)")
            }
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {

                let location = try JSONDecoder().decode([Location].self, from: validData)
                completion(.success(location))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
            
        }.resume()
    }

}
