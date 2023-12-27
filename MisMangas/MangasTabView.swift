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
            
            MangasBDListView(mangasVM: mangasVM)
                .tabItem {
                    Label("BD Mangas", systemImage: "books.vertical.fill")
                }
            
            MisMangasGridView(mangasVM: mangasVM)
                .tabItem {
                    Label("Mis mangas", systemImage: "star.fill"
                    )
                        
                }
        }
    }
}

#Preview {
    MangasTabView()
}
