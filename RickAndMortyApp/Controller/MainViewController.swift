//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import UIKit

class MainViewController: UITableViewController {
    
    var networkManager = NetworkManager()
    
    let ItemArray = ["Characters", "Locations", "Episodes"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkManager.fetchCharacters()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        
        cell.textLabel?.text = ItemArray[indexPath.row]
        
        return cell
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "GoToCharacters", sender: self)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! CharactersViewController
//        if let indexPath = tableView.indexPathForSelectedRow {
//            destinationVC.viewDidLoad()
//        }
//    }

}

