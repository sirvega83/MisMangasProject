//
//  MangaDTO.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

struct MangasDTO: Codable {
    let metadata: Metadata
    let items: [ItemsDTO]
}

struct Metadata: Codable {
    let per, total, page: Int
}

struct ItemsDTO: Codable {
        let chapters: Int?
        let score: Double
        let mainPicture: String
        let background: String?
        let url: String?
        let endDate: Date?
        let genres: [GenreDTO]
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
}

struct GenreDTO: Codable, Hashable {
    let id: String
    let genre: Genre
}

enum Genre: String, Codable, CaseIterable, Identifiable {
    var id: Self {self}
    
    case comedy = "Comedy"
    case romance = "Romance"
    case fantasy = "Fantasy"
    case supernatural = "Supernatural"
    case ecchi = "Ecchi"
    case action = "Action"
    case adventure = "Adventure"
    case drama = "Drama"
    case awardWinning = "Award Winning"
    case sliceOfLife = "Slice of Life"
    case sciFi = "Sci-Fi"
    case mystery = "Mystery"
    case horror = "Horror"
    case sports = "Sports"
    case suspense = "Suspense"
    case erotica = "Erotica"
    case girlsLove = "Girls Love"
    case hentai = "Hentai"
    case boysLove = "Boys Love"
}

struct AuthorDTO: Codable, Hashable, Identifiable {
    let firstName, lastName, id: String
    let role: RoleDTO
}

enum RoleDTO: String, Codable {
    case art = "Art"
    case story = "Story"
    case storyArt = "Story & Art"
}

struct ThemeDTO: Codable, Hashable {
    let id, theme: String
}

struct DemographicDTO: Codable, Hashable {
    let demographic, id: String
}

enum StatusDTO: String, Codable {
    case finished = "finished"
    case currentlyPublishing = "currently_publishing"
    case onHiatus = "on_hiatus"
    case discontinued = "discontinued"
}


extension ItemsDTO {
    var toPresentation: Manga {
        Manga(chapters: chapters, score: score, mainPicture: mainPicture, background: background, url: "", endDate: endDate, genres: genres.map(\.toPresenttion), title: title, titleEnglish: titleEnglish, authors: authors, sypnosis: sypnosis, startDate: startDate, themes: themes, demographics: demographics, volumes: volumes, id: id, status: status, titleJapanese: titleJapanese, isFavorite: false)
    }
    
}

extension GenreDTO {
    var toPresenttion: Genre2 {
        Genre2(id: id, genre: genre)
    }
}
