//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Ana Ptskialadze on 04.05.24.
//

import SwiftUI

let contentItem = [
    "Characters",
    "Locations",
    "Episodes"
]

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    ForEach(contentItem, id: \.self) { item in
                        NavigationLink(item, destination: CharacterListView())
                    }
                }, header: {
                    Text("Choose your journey").bold().font(.callout)
                })
                
            }
            
            .navigationTitle("RickAndMortyApp")
        }
    }
}

//List(networkManager.posts) { post in
//    NavigationLink(destination: DetailView(url: post.url)) {
//        HStack {
//            Text(String(post.points))
//            Text(post.title)
//        }
//    }
//}

#Preview {
    ContentView()
}