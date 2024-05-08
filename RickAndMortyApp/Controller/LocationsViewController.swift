//
//  LocationsViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 08.05.24.
//
import UIKit

class LocationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchLocationsData()
    }
    
    private func fetchLocationsData() {
        NetworkManager.shared.fetchData(from: .locations) { [weak self] (result: Result<LocationResults, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.locations = results.results
                    self?.tableView.reloadData() // Reload the table view here
                case .failure(let error):
                    // Handle any errors
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        let location = locations[indexPath.row]
        cell.textLabel?.text = location.name
        // Configure the rest of your cell with location details
        return cell
    }
    
    // Rest of your view controller code...
}
