//
//  JsonDecoder.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

func getJSON<JSON: Codable>(request: URLRequest, type: JSON.Type) async throws -> JSON {
    let (data, response) = try await URLSession.shared.getDataCustom(request: request)
    if response.statusCode == 200 {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
            return try decoder.decode(type.self, from: data)
        } catch {
            print(error)
            throw NetworkErrors.parseJson
        }
    } else {
        throw NetworkErrors.statusCode(response.statusCode)
    }
}
