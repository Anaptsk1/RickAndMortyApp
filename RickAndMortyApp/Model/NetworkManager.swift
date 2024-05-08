//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import Foundation

class NetworkManager: ObservableObject {
    
    let urlString = "https://rickandmortyapi.com/api/character"
    
    func fetchCharacters() {
        performRequest(urlString: urlString)
    }
    
    func performRequest (urlString: String) {
        
        // 1. Create a URL
        
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(characterData: safeData)
                }
                
            }
            
            // 4. Start the task
            
            task.resume()
            
        }
        
    }
    
    func parseJSON (characterData: Data) {
        
        
        
    }
    
    
    
    

//    @Published var characters = [Character]()
//    @Published var episodes = [Episode]()
//    @Published var locations = [Location]()
//    
//    func fetchCharacterData() {
//        if let url = URL(string: "https://rickandmortyapi.com/api/character" ) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode(Results.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.characters = results.Character
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//    
//    func fetchEpisodeData() {
//        if let url = URL(string: "https://rickandmortyapi.com/api/episode" ) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode(Results.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.episodes = results.Episode
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//    
//    func fetchLocationData() {
//        if let url = URL(string: "https://rickandmortyapi.com/api/episode" ) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode(Results.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.locations = results.Location
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//    
//    
//   
    
}
