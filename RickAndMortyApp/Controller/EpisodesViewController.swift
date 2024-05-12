//
//  EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 08.05.24.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var episodes: [Episode] = []
    var nextURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //        searchBar.delegate = self
        fetchEpisodesData()
    }
    
    private func fetchEpisodesData() {
        
        let endPoint: URL
        
        if let nextURL = nextURL {
            endPoint = nextURL
        } else {
            endPoint = URL(string: "https://rickandmortyapi.com/api/episode")!
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
                    let results = try JSONDecoder().decode(EpisodeResults.self, from: validData)
                    self?.episodes.append(contentsOf: results.results)
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
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == episodes.count - 1, nextURL != nil {
            fetchEpisodesData()
        }
    }
}
