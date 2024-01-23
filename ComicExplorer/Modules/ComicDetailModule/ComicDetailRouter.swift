//
//  ComicDetailRouter.swift
//  ComicExplorer
//
//  Created by Azure on 22/1/24.
//

import Foundation
import SwiftUI

class ComicDetailRouter: PresenterToRouterComicDetailProtocol {
    static func createModule(_ comic: ComicItem) -> some View {
        let interactor = ComicDetailInteractor()
        let presenter = ComicDetailPresenter(interactor: interactor, router: ComicDetailRouter())
        let view = ComicDetailView(presenter: presenter)
        presenter.view = view
        interactor.presenter = presenter
        presenter.comic = comic
        return view
    }
}
