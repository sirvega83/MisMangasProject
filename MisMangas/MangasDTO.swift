//
//  MangaDTO.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

struct MangasDTO: Codable {
    let items: [Items]
}

struct Items: Codable {
    let volumes: Int?
//    let status: Status
    let chapters: Int?
    let title: String
    let startDate: String
    //let themes: [Theme]?
    let mainPicture: String
    let score: Double
    let titleEnglish: String?
    let endDate: String?
    let sypnosis: String?
    let id: Int
}


//
//
//struct Theme: Codable, Hashable {
//    let id, theme: String
//}

extension Items {
    var toPresentation: Mangas {
        Mangas(volumes: volumes, chapters: chapters, title: title, startDate: startDate,  mainPicture: mainPicture, score: score, titleEnglish: titleEnglish, id: id)
    }
}
