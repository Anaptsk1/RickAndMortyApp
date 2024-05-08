//
//  EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 08.05.24.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView! // Make sure this is connected in the storyboard
    
    var episodes: [Episode] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchEpisodesData()
    }
    
    private func fetchEpisodesData() {
        NetworkManager.shared.fetchData(from: .episodes) { [weak self] (result: Result<EpisodeResults, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    print("\(results)")
//                    self?.episodes = episodeResults.results
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
        return episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.name
        // Configure the rest of your cell with episode details
        return cell
    }
    
    // Rest of your view controller code...
}
