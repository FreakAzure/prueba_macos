//
//  ComicListView.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation
import SwiftUI

struct ComicListView: View {
    @ObservedObject var presenter: ComicListPresenter
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(presenter: ComicListPresenter) {
        self.presenter = presenter
    }
    
    private var sortedCreatorNames: [String] {
        Array(presenter.comics.keys).sorted()
     }
    
    var body: some View {
        if (presenter.comics.isEmpty) {
            Text("No data available")
                .onAppear(perform: {
                presenter.viewLoaded()
            })
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(sortedCreatorNames, id: \.self) { creatorName in
                        creatorSectionView(creatorName: creatorName)
                    }
                }
                .padding()
            }.onAppear(perform: {
                presenter.viewLoaded()
            })
        }
    }
    
    private func creatorSectionView(creatorName: String) -> some View {
           let comics = presenter.comics[creatorName] ?? []
           return Section(header: Text(creatorName).font(.headline)) {
               ForEach(comics, id: \.id) { comic in
                   ComicView(comic: comic).onTapGesture {
                       Singleton.shared.selectedComic = comic
                   }
               }
           }
       }
    
    
}

struct ComicView: View {
    let comic: ComicItem

    var body: some View {
        VStack {
            Text(comic.title)
            // Additional comic details
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}
