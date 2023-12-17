//
//  Manga.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

struct Mangas: Identifiable, Hashable {

    let volumes: Int?
//    let status: Status
    let chapters: Int?
    let title: String
    let startDate: String
    //let themes: [Theme]?
    let mainPicture: String
    let score: Double
    let titleEnglish: String?
    let id: Int
    
    var mainPictureURL: URL? {
        let cleanPicture = mainPicture.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return URL(string: "\(cleanPicture)")
    }
}

