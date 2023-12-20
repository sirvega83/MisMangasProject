//
//  TestData.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation

extension Mangas {
    static let testPreview = Mangas(chapters: 1, score: 5.67, mainPicture: "https://cdn.myanimelist.net/images/manga/3/4525l.jpg", background: "Orient has been published digitally in English by Kodansha USA since April 7, 2020, and in print since January 26, 2021. The series has also been simulpub through K Manga.", url: "https://myanimelist.net/manga/113644/Orient", endDate: Date.now, genres: [], title: "Otokonoko", titleEnglish: "Dragon Ball", authors: [], sypnosis: "Five years ago, Musashi made a promise with his friend Kojirou Kanemaki that once they grew up, they would become samurai, form a league, and go on demon-slaying quests.", startDate: Date.now, themes: [], demographics: [], volumes: 4, id: 2, status: .finished, titleJapanese: "新約 とある魔術の禁書目録SS")
}

struct testLocalMangas: MangaInteractorProcotocol {
    let urlTest = Bundle.main.url(forResource: "TestJsonMangas", withExtension: "json")!
    
    func getMangaInteractor() async throws -> [Mangas] {
        let data = try Data(contentsOf: urlTest)
        return try JSONDecoder().decode(MangasDTO.self, from: data).items.map(\.toPresentation)
    }
}

extension MangasViewModel {
    static let localTestMangas = MangasViewModel(mangaInteractor: testLocalMangas())
}
