//
//  URLRequest.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

extension URLRequest {
    
    static func getCustom(url: URL, page: Int, per: Int = 30, contain: String? = nil) -> URLRequest {
        let page = URLQueryItem.init(name: "page", value: String(page))
        let per = URLQueryItem(name: "per", value: String(per))
        var request = URLRequest(url: url.appending(path: contain ?? ""))

        request.url?.append(queryItems: [page, per])
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        return request
    }
    
    static func getBy(url: URL, genre: Genre) -> URLRequest {
        var request = URLRequest(url: url.appending(path: String(genre.rawValue)))
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        return request
    }
    
}



