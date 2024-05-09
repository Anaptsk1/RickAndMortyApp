//
//  DataService.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//
import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchCharactersData()
    }
    
    private func fetchCharactersData() {
        NetworkManager.shared.fetchData(from: .characters) { [weak self] (result: Result<CharacterResults, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.characters = results.results
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
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        // Configure the rest of your cell with character details
        return cell
    }
    
    // Rest of your view controller code...
}
