//
//  ComicDetailView.swift
//  ComicExplorer
//
//  Created by Azure on 22/1/24.
//

import Foundation
import SwiftUI

struct ComicDetailView: View {
    @ObservedObject var presenter: ComicDetailPresenter
    
    init(presenter: ComicDetailPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        let comic = presenter.comic
        if (comic != nil){
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // Thumbnail
                    if let imagePath = comic!.thumbnail.path {
                        AsyncImage(url: URL(string: imagePath))
                            .aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    }
                    
                    // Title
                    Text(comic!.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Text Objects
                    ForEach(comic!.textObjects, id: \.text) { textObject in
                        VStack(alignment: .leading) {
                            Text(textObject.text)
                        }
                    }

                    // Creators
                    VStack(alignment: .leading) {
                        Text("Creators:")
                            .font(.headline)
                        ForEach(comic!.creators.items, id: \.name) { creator in
                            Text("\(creator.name) - \(creator.role)")
                        }
                    }
                    
                    // Page Count
                    if let pageCount = comic!.pageCount {
                        Text("Pages: \(pageCount)")
                    }
                    
                   
              
                                    }
                .padding()
            }
        } else {
            Text("Comic not available")
        }
    }
}
