//
//  NetworkErrors.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

enum NetworkErrors: Error, CustomStringConvertible {
    case noHTTP
    case statusCode(Int)
    case general(Error)
    case parseJson
    
    var description: String {
        switch self {
        case .noHTTP:
            "Fallo conexión HTTP "
        case .statusCode(let int):
            "Error status code \(int)"
        case .general(let error):
            "Error general \(error)"
        case .parseJson:
            "Error al decodificar el Json"
        }
    }
}
