//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    
    enum APIError: Error {
        case invalidURL
        case requestFailed
    }
    
    enum Endpoint: String {
        case characters = "/api/character"
        case locations = "/api/location"
        case episodes = "/api/episode"
    }
    
    func fetchData<T: Decodable>(from endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "rickandmortyapi.com"
        componentURL.path = endpoint.rawValue
        
        guard let validURL = componentURL.url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API Status: \(httpResponse.statusCode)")
            }
            
            guard let validData = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.requestFailed))
                }
                return
            }
            
            do {
                let results = try JSONDecoder().decode(T.self, from: validData)
                completion(.success(results))
            } catch let serializationError {
                print("JSON Decoding Error: \(serializationError)")
                completion(.failure(serializationError))
            }
            
        }.resume()
    }
    
}
