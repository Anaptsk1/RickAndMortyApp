//
//  DataService.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 01.05.24.
//
import UIKit
import CoreData

class CharactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var characters: [Character] = []
    var nextURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        searchBar.delegate = self
        fetchCharactersData()
    }
    
    @objc func fetchCharactersData() {
        
        let endPoint: URL
        
        if let nextURL = nextURL {
            endPoint = nextURL
        } else {
            endPoint = URL(string: "https://rickandmortyapi.com/api/character")!
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
                    let results = try JSONDecoder().decode(CharacterResults.self, from: validData)
                    self?.characters.append(contentsOf: results.results)
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
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - 1, nextURL != nil {
            fetchCharactersData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToCharacterDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! CharacterDetailsViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.viewDidLoad()
        }
    }
}

//    // MARK: - UISearchBar delegate methods
//
//    extension CharactersViewController: UISearchBarDelegate {
//
//        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            characters = characters.filter("name CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
//            tableView.reloadData()
//        }
//}

