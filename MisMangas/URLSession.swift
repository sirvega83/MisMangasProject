//
//  URLSession.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

extension URLSession {
    func getDataCustom(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else { throw NetworkErrors.noHTTP }
            return (data, httpResponse)
        } catch {
            throw NetworkErrors.general(error)
        }
    }
}
