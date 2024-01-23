//
//  Comic.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation


struct MarvelResponse: Codable {
    let code: Int
    let data: MarvelData
    let status: ApiStatus
}

struct MarvelData: Codable {
    let results: [Comic]
}

struct Comic: Codable {
    let id: Int
    let title: String
    let description: String?
    let creators: Creators
    let pageCount: Int?
    let isbn: String?
    let thumbnail: Image
    let textObjects: [TextObject]
}

struct TextObject: Codable {
    let type: String
    let language: String
    let text: String
}

struct Image: Codable {
    let path: String?
}

struct Creators: Codable {
    let items: [Creator]
    let collectionURI: String
}

struct Creator: Codable {
    let name: String
    let role: String
    let resourceURI: String
}

enum ApiStatus: String, Codable {
    case Ok
    case Ko
}

struct ComicItem: Identifiable {
    let id: String
    let title: String
    let description: String?
    let creators: Creators
    let pageCount: Int?
    let isbn: String?
    let thumbnail: Image
    let textObjects: [TextObject]
    let apiId: Int
    
    init(comic: Comic) {
        self.id = UUID().uuidString
        self.title = comic.title
        self.description = comic.description
        self.creators = comic.creators
        self.pageCount = comic.pageCount
        self.isbn = comic.isbn
        self.thumbnail = comic.thumbnail
        self.textObjects = comic.textObjects
        self.apiId = comic.id
    }
}
