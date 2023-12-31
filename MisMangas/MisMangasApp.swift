//
//  MisMangasApp.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

@main
struct MisMangasApp: App {
    @StateObject var mangasVM = MangasViewModel()
    
    var body: some Scene {
        WindowGroup {
            MangasTabView( )
                .environmentObject(mangasVM)
        }
    }
}
