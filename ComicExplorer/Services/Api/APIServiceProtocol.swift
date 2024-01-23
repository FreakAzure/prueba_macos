//
//  APIServiceProtocol.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation
protocol APIServiceProtocol {
    func fetchComics(completion: @escaping (Result<[Comic], Error>) -> Void)
}
