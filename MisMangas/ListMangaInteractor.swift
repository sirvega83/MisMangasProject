//
//  ListMangaInteractor.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation

protocol MangaInteractorProcotocol {
    func getManga(page: Int) async throws -> [Manga]
    func getStringToFind(stringToFind: String) async throws -> [Manga]
}

struct MangaInteractor: MangaInteractorProcotocol {
    func getManga(page: Int) async throws -> [Manga] {
        try await getJSON(request: .getCustom(url: .listMangaURL, page: page), type: MangasDTO.self).items.map(\.toPresentation)
    }
    
    func getStringToFind(stringToFind: String) async throws -> [Manga] {
        try await getJSON(request: .getStringToFind(url: .mangaContainsURL, stringToFind: stringToFind), type: MangasDTO.self).items.map(\.toPresentation)
    }
}

