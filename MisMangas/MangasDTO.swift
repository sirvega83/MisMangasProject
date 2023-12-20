//
//  MangaDTO.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

struct MangasDTO: Codable {
    let metadata: Metadata
    let items: [Items]
}

struct Metadata: Codable {
    let per, total, page: Int
}

struct Items: Codable {
        let chapters: Int?
        let score: Double
        let mainPicture: String
        let background: String?
        let url: String?
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
}

struct Genre: Codable, Hashable {
    let id, genre: String
}

struct Author: Codable, Hashable {
    let firstName, lastName, id: String
    let role: Role
}

enum Role: String, Codable {
    case art = "Art"
    case story = "Story"
    case storyArt = "Story & Art"
}

struct Theme: Codable, Hashable {
    let id, theme: String
}

struct Demographic: Codable, Hashable {
    let demographic, id: String
}

enum Status: String, Codable {
    case finished = "finished"
    case  currentlyPublishing = "currently_publishing"
}


extension Items {
    var toPresentation: Mangas {
        Mangas(chapters: chapters, score: score, mainPicture: mainPicture, background: background, url: "", endDate: endDate, genres: genres, title: title, titleEnglish: titleEnglish, authors: authors, sypnosis: sypnosis, startDate: startDate, themes: themes, demographics: demographics, volumes: volumes, id: id, status: status, titleJapanese: titleJapanese)
    }
}
