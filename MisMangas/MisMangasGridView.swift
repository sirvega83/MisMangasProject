//
//  MisMangasGridView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct MisMangasGridView: View {
    
    @ObservedObject var mangasVM : MangasViewModel
    
    let itemAdaptative = GridItem(.adaptive(minimum: 130))
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [itemAdaptative], content: {
                    ForEach(mangasVM.loadFavorites()) { manga in
                        NavigationLink(value: manga){
                            MangaGridCellView(mangas: manga)
                    
                        }
    
                    }
                })
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Mis mangas")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Manga.self) { detail in
                MangasDetailView(mangasVM: mangasVM, mangas: detail)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MisMangasGridView(mangasVM: .localTestMangas)
    }
}

