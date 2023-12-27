//
//  MangasBDListView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

enum filterBy {
    case author
    case genre
    case demographic
    case theme
}

struct MangasBDListView: View {
    
    @ObservedObject var mangasVM: MangasViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mangasVM.searchMangas()){ manga in
                    NavigationLink(value: manga){
                        MangaListCellView(mangas: manga)
                            .onAppear {
                                mangasVM.nextPage(manga: manga)
                            }
                            .swipeActions(edge: .leading) {
                                Button(action: {
                                    mangasVM.toogleFavorites(favoriteManga: manga)
                                }, label: {
                                    if manga.isFavorite {
                                        Label("Quitar de mis mangas", systemImage: "star.fill").tint(.red)
                                    } else {
                                        Label("Añadir a mis mangas", systemImage: "star.fill").tint(.yellow)
                                    }
                                })
                            }
                    }
                }
                
            }
            //            .toolbar {
            //                ToolbarItem(placement: .topBarTrailing) {
            //                    Menu {
            //                        ForEach(filterBy) { filter in
            //                            filter
            //                        }
            //                        Text("prueba")
            //                    } label: {
            //                        Label("Filtrar por", systemImage: "line.3.horizontal.decrease.circle.fill")
            //                    }
            //
            //                }
        }
        .searchable(text: $mangasVM.searchText, placement: .toolbar, prompt: "Buscador de mangas")
        .navigationTitle("Biblioteca Mangas")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Manga.self) { detail in
            MangasDetailView(mangasVM: mangasVM, mangas: detail)
        }
    }
}


#Preview {
    NavigationStack {
        MangasBDListView(mangasVM: .localTestMangas)
    }
}
