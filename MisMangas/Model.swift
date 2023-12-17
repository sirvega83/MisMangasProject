//
//  Model.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 17/12/23.
//

import Foundation

enum Status: String, Codable, CodingKey {
    case finished = "finished"
    case currently_publishing = "currentlyPublishing"
}
