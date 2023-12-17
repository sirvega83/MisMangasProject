//
//  ListMangaInteractor.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation

protocol MangaInteractorProcotocol {
    func getMangaInteractor() async throws -> [Mangas]
}

struct MangaInteractor: MangaInteractorProcotocol {
    func getMangaInteractor() async throws -> [Mangas] {
        try await getJSON(request: .getCustom(url: .listMangaURL), type: MangasDTO.self).items.map(\.toPresentation)
    }
}
