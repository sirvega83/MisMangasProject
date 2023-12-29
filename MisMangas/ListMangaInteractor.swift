//
//  ListMangaInteractor.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation

protocol MangaInteractorProcotocol {
    func getManga(page: Int) async throws -> [Manga]
    func searchManga(page: Int, contain: String) async throws -> [Manga]
    func mangaByGenre(genre: Genre) async throws -> [Manga]
}

struct MangaInteractor: MangaInteractorProcotocol {
   
    func getManga(page: Int) async throws -> [Manga] {
        try await getJSON(request: .getCustom(url: .listMangaURL, page: page), type: MangasDTO.self).items.map(\.toPresentation)
    }
    
    func searchManga(page: Int, contain: String) async throws -> [Manga] {
        try await getJSON(request: .getCustom(url: .mangaContainsURL, page: page, per: 10, contain: contain), type: MangasDTO.self).items.map(\.toPresentation)
    }
    
    func mangaByGenre(genre: Genre) async throws -> [Manga] {
        try await getJSON(request: .getBy(url: .mangaByGenreURL, genre: genre), type: MangasDTO.self).items.map(\.toPresentation)
    }
}
