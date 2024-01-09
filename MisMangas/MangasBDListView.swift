//
//  MangasBDListView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct MangasBDListView: View {
    @EnvironmentObject var mangasVM: MangasViewModel
    
    @State var showGenres = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mangasVM.mangas){ manga in
                    NavigationLink(value: manga){
                        MangaListCellView( mangas: manga)
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
            .sheet(isPresented: $showGenres, content: {
                FilterByGenreView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showGenres.toggle()
                    } label: {
                        Label("Filtrar por", systemImage: "line.3.horizontal.decrease.circle.fill")
                    }
                }
            }
            .searchable(text: $mangasVM.searchText, placement: .toolbar, prompt: "Buscador de mangas")
            .onChange(of: mangasVM.searchText, {
                Task {
                    await mangasVM.searchMangas()
                    sleep(1)
                }
            })
            .navigationTitle("Biblioteca Mangas")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Manga.self) { detail in
                MangasDetailView(mangas: detail)
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        MangasBDListView( )
            .environmentObject(MangasViewModel())
    }
}
