//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 04.05.24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("Characters", destination: CharactersView())
                    //                    NavigationLink("Locations", destination: LocationsView())
                    //                    NavigationLink("Episodes", destination: EpisodesView())
                } header: {
                    Text("Choose your journey").bold().font(.callout)
                }
            }.navigationTitle("RickAndMortyApp")
        }
    }
}

#Preview {
    ContentView()
}
