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
                    ForEach(mangasVM.mangas) { manga in
                        NavigationLink(value: manga){
                            MangaGridCellView(manga: manga)
                        }
                    }
                })
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Mis mangas")
            .navigationDestination(for: Mangas.self) { detail in
                MangasDetailView(manga: detail)
            }
        }
    }
}

#Preview {
        MisMangasGridView(mangasVM: .localTestMangas)
}

