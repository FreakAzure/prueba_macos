//
//  ComicListPresenter.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation
import SwiftUI

class ComicListPresenter: ObservableObject, ViewToPresenterComicListProtocol {

    
    var view: ComicListView?
    var router: ComicListRouter
    private let interactor: ComicListInteractor
    
    @Published var comics = [String: [ComicItem]]()
    @Published var errorMessage: String?
    
    func viewLoaded() {
        interactor.loadComics()
    }
    
    init(interactor: ComicListInteractor, router: ComicListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
}

extension ComicListPresenter: InteractorToPresenterComicListProtocol {
    func loadComics(_ comics: [String: [ComicItem]] ) {
        self.comics = comics
        print(comics)
    }
}
