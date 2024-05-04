//
//  DataService.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import UIKit

class CharactersViewController: UIViewController {
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        networkManager.fetchCharacterData()
    }
    
    
    
}
