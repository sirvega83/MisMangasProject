//
//  MangasBDListView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct MangasBDListView: View {
    
    @ObservedObject var mangasVM: MangasViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mangasVM.mangas) { manga in
                    NavigationLink(value: manga){
                        MangaListCellView(manga: manga)
                    }
                }
            }
            .navigationTitle("Biblioteca Mangas")
            .navigationDestination(for: Mangas.self) { detail in
                MangasDetailView(manga: detail)
            }
        }
    }
}

#Preview {
    MangasBDListView(mangasVM: .localTestMangas)
}
