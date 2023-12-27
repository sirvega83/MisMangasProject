//
//  Extension.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 17/12/23.
//

import Foundation

extension DateFormatter {
    static let dateFormatCustom = {
            let date = DateFormatter()
            date.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return date
        }()
}


