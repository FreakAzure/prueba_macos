//
//  Singleton.swift
//  ComicExplorer
//
//  Created by Azure on 23/1/24.
//

import Foundation

class Singleton: ObservableObject {
    static let shared = Singleton()
    @Published var selectedComic: ComicItem?
}
