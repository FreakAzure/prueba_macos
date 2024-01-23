//
//  ApiService.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation

class ApiService {
    // Reusable Api Call method
    private let publicKey = "7b327264f9f8ad41c5de23681d1dfdd7"
    private let privateKey = "9c6c7c7f2f8657c1cba39e5e038a2884a409a792"
    private func callAPI<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts + privateKey + publicKey)
        guard let url = URL(string: "\(endpoint)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)") else {
            completion(.failure(APIServiceError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(APIServiceError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIServiceError.noData))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

extension ApiService: APIServiceProtocol {
    
    func fetchComics(completion: @escaping (Result<[Comic], Error>) -> Void) {
        let endpoint = "https://gateway.marvel.com:443/v1/public/comics"
        callAPI(endpoint: endpoint) { (result: Result<MarvelResponse, Error>) in
            switch result {
            case .success(let marvelResponse):
                completion(.success(marvelResponse.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
}


enum APIServiceError: Error {
    case invalidURL, invalidResponse, noData
}
