//
//  Manga.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

struct Manga: Identifiable, Hashable, Codable {
    let chapters: Int?
    let score: Double
    let mainPicture: String
    let background: String?
    let url: String
    let endDate: Date?
    let genres: [Genre2]
    let title: String
    let titleEnglish: String?
    let authors: [AuthorDTO]
    let sypnosis: String?
    let startDate: Date?
    let themes: [ThemeDTO]
    let demographics: [DemographicDTO]
    let volumes: Int?
    let id: Int
    let status: StatusDTO
    let titleJapanese: String?
    var isFavorite: Bool
  
    
    
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

struct Genre2: Codable, Identifiable, Hashable {
    let id: String
    let genre: Genre
}
