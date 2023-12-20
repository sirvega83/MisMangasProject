//
//  MangasTabView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct MangasTabView: View {
    
    @ObservedObject var mangasVM = MangasViewModel()
    
    var body: some View {
        TabView {
            MisMangasGridView(mangasVM: mangasVM)
                .tabItem {
                    Label("Mis mangas", systemImage: "star.fill"
                    )
                        
                }
            MangasBDListView(mangasVM: mangasVM)
                .tabItem {
                    Label("BD Mangas", systemImage: "books.vertical.fill")
                }
        }
    }
}

#Preview {
    MangasTabView()
}
