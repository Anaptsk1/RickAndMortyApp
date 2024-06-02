//
//  CharacterDetailsViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 12.05.24.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
//    @IBOutlet weak var episodeLabel: UILabel!
    
    var character: Character?
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI() {
        guard let character = character else {return}
        
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        originLabel.text = character.origin["name"]
        locationLabel.text = character.location["name"]
//        episodeLabel.text = character.episode
        
        fetchImage(from: character.image) { [weak self] image in
            self?.characterImageView.image = image
        }
    }
    
    func fetchImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}
