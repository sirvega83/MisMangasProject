//
//  TestData.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation

extension Mangas {
    static let testPreview = Mangas(volumes: 1, chapters: 2, title: "Otokonoko", startDate: "15/12/2023", mainPicture: "https://cdn.myanimelist.net/images/manga/3/4525l.jpg", score: 7.13, titleEnglish: "Dragon Ball", id: 12)
}

struct testLocalMangas: MangaInteractorProcotocol {
    let urlTest = Bundle.main.url(forResource: "TestMangasLocal", withExtension: "json")
    
    func getMangaInteractor() async throws -> [Mangas] {
        let data = try Data(contentsOf: urlTest!)
        return try JSONDecoder().decode(MangasDTO.self, from: data).items.map(\.toPresentation)
    }
}

extension MangasViewModel {
    static let localTestMangas = MangasViewModel(mangaInteractor: testLocalMangas())
}
