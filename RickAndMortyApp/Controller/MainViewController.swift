//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//

import UIKit
//import ChameleonFramework

class MainViewController: UITableViewController {
    
    let itemArray = ["Characters", "Locations", "Episodes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
//        if let colour = FlatSkyblue().darken(byPercentage:CGFloat(indexPath.row / itemArray!.count)) {
//        cell.backgroundColor = colour
//        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        var segueIdentifier: String?
        
        switch indexPath.row {
        case 0:
            segueIdentifier = "GoToCharacters"
        case 1:
            segueIdentifier = "GoToLocations"
        case 2:
            segueIdentifier = "GoToEpisodes"
        default:
            print("Invalid selection.")
        }
        
        if let identifier = segueIdentifier {
            performSegue(withIdentifier: identifier, sender: self)
        }
    }
    
    //MARK: - Handling multiple screens
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else { return }
        
        switch segue.identifier {
        case "GoToCharacters":
            let destinationVC = segue.destination as! CharactersViewController
            // Pass any data to destinationVC if needed
            destinationVC.viewDidLoad()
        case "GoToLocations":
            let destinationVC = segue.destination as! LocationsViewController
            // Pass any data to destinationVC if needed
            destinationVC.viewDidLoad()
        case "GoToEpisodes":
            let destinationVC = segue.destination as! EpisodesViewController
            // Pass any data to destinationVC if needed
            destinationVC.viewDidLoad()
        default:
            print("No such segue identifier found")
        }
    }
}






