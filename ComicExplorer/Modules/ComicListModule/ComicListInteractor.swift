//
//  ComicListInteractor.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation
class ComicListInteractor: PresenterToInteractorComicListProtocol {
    var presenter: ComicListPresenter?
    let apiService = ApiService()
    
    func loadComics() {
        apiService.fetchComics(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedCommics):
                    self.presenter?.loadComics(self.groupComicsByCreator(fetchedCommics))
                case .failure(let error):
                    // TODO: show some sort of error message :)
                    print(error)
                }
            }
        })
    }
    
    private func groupComicsByCreator(_ comics: [Comic]) -> [String: [ComicItem]] {
        var groupedComics = [String: [ComicItem]]()

        for comic in comics {
            for creator in comic.creators.items {
                let comicEntry = ComicItem(comic: comic)
                groupedComics[creator.name, default: []].append(comicEntry)
            }
        }

        return groupedComics
    }

    
}
