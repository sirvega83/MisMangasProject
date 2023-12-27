//
//  URLRequest.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

extension URLRequest {
    static func getCustom(url: URL, page: Int, per: Int = 30) -> URLRequest {
        let page = URLQueryItem.init(name: "page", value: String(page))
        let per = URLQueryItem(name: "per", value: String(per))
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [page, per])
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        return request
    }
    
    static func getStringToFind(url: URL, stringToFind: String) -> URLRequest {
        let stringToFind = URLQueryItem(name: stringToFind, value: stringToFind)
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [stringToFind])
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        return request
    }
}
