//
//  LocationDetailsViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 02.06.24.
//

import UIKit

class LocationDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    
    var location: Location?
    
    override func viewDidLoad() {
        setupUI()
    }
    
    func setupUI() {
        guard let location = location else {return}
        
        nameLabel.text = location.name
        typeLabel.text = location.type
        dimensionLabel.text = location.dimension
    }
}
