//
//  ComicListRouter.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation
import SwiftUI

class ComicListRouter: PresenterToRouterComicListProtocol {

    static func createModule() -> some View {
        
        let interactor = ComicListInteractor()
        let presenter = ComicListPresenter(interactor: interactor, router: ComicListRouter())
        let view = ComicListView(presenter: presenter)
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
}
