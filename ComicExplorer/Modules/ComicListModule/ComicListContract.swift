//
//  ComicListContract.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation

protocol PresenterToRouterComicListProtocol: AnyObject {
    
}

protocol ViewToPresenterComicListProtocol: AnyObject {
    func viewLoaded()
}

protocol PresenterToInteractorComicListProtocol: AnyObject {
    func loadComics()
}

protocol InteractorToPresenterComicListProtocol: AnyObject {
    func loadComics(_ comics: [String: [ComicItem]] )
}

protocol PresenterToViewComicListProtocol: AnyObject {
    
}
