//
//  Manga.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

struct Mangas: Identifiable, Hashable {
    let chapters: Int?
    let score: Double
    let mainPicture: String
    let background: String?
    let url: String
    let endDate: Date?
    let genres: [Genre]
    let title: String
    let titleEnglish: String?
    let authors: [Author]
    let sypnosis: String?
    let startDate: Date
    let themes: [Theme]
    let demographics: [Demographic]
    let volumes: Int?
    let id: Int
    let status: Status
    let titleJapanese: String
    
    
    var formattedMainPicture: URL? {
        let formattedMainPictureURL = mainPicture.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return URL(string: "\(formattedMainPictureURL)")
    }
    
    var formattedURL: URL? {
        let formattedUrl = url.trimmingCharacters(in: CharacterSet(charactersIn: "\""))
        return URL(string: "\(formattedUrl)")
    }
    
    var scoreWithTwoDecimals: String {
        score.formatted(.number.precision(.fractionLength(1)))
    }
    
    var scoreRate: Double {
        score / 10
    }
}

