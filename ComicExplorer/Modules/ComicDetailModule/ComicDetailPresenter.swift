//
//  ComicDetailPresenter.swift
//  ComicExplorer
//
//  Created by Azure on 22/1/24.
//

import Foundation
import SwiftUI

class ComicDetailPresenter: ObservableObject, ViewToPresenterComicDetailProtocol {
    
    var view: ComicDetailView?
    var router: ComicDetailRouter
    private let interactor: ComicDetailInteractor
    
    @Published var comic: ComicItem?
    
    func viewLoaded() {
    }
    
    init(interactor: ComicDetailInteractor, router: ComicDetailRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension ComicDetailPresenter: InteractorToPresenterComicDetailProtocol {
    
}
