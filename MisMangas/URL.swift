//
//  Interface.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

let mainURL = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com")!

extension URL {
    static let listMangaURL = mainURL.appending(path: "list/mangas") 
    static let mangaContainsURL = mainURL.appending(path: "search/mangasContains")
}
