//
//  URLRequest.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

extension URLRequest {
    static func getCustom(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
//        request.setValue("aplication/json", forHTTPHeaderField: "Accept")
        return request
    }
}
