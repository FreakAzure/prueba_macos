//
//  ContentView.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var singleton = Singleton.shared
    
    var body: some View {
        VStack {
            if let selectedComic = singleton.selectedComic {
                ComicDetailRouter.createModule(selectedComic)
            } else {
                Text("Welcome To Comic explorer, please access the status bar menu to select a comic to explore")
            }
        }
    }
}

#Preview {
    ContentView()
}
