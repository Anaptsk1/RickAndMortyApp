//
//  EpisodeDetailsViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 13.05.24.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    var episode: Episode?
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI() {
        
        guard let episode = episode else {return}
        
        nameLabel.text = episode.name
        dateLabel.text = episode.air_date
        episodeLabel.text = episode.episode
    }
}
