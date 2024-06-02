//
//  LocationsViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 08.05.24.
//
import UIKit

class LocationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var locations: [Location] = [] // All locations
    var filteredLocations: [Location] = [] // Filtered locations with the search
    var isSearching = false
    var nextURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        fetchLocationsData()
    }
    
    private func fetchLocationsData() {
        
        let endPoint: URL
        
        if let nextURL = nextURL {
            endPoint = nextURL
        } else {
            endPoint = URL(string: "https://rickandmortyapi.com/api/location")!
        }
        
        URLSession.shared.dataTask(with: endPoint) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let validData = data else {
                    print("No data")
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(LocationResults.self, from: validData)
                    self?.locations.append(contentsOf: results.results)
                    self?.nextURL = URL(string: results.info.next ?? "")
                    self?.tableView.reloadData()
                } catch {
                    print("JSON Decoding Error: \(error)")
                }
            }
        }.resume()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredLocations.count : locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        let location = isSearching ? filteredLocations[indexPath.row] : locations[indexPath.row]
        cell.textLabel?.text = location.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == locations.count - 1, nextURL != nil {
            fetchLocationsData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showLocationDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLocationDetails",
           let destinationVC = segue.destination as? LocationDetailsViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.location = locations[indexPath.row]
        }
    }
    
    // MARK: - UISearchBar delegate methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
        } else {
            isSearching = true
            filteredLocations = locations.filter { location in
                location.name.lowercased().contains(searchText.lowercased())
            }
            
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}





