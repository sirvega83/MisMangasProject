//
//  MangasViewModel.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation



final class MangasViewModel: ObservableObject {
    @Published var mangas: [Manga] = []
    @Published var searchText: String = "" {
        willSet {
            page = 1
        }
    }
    
    @Published var selectedGenre: String = "" {
        didSet { //valor actual
            if let genre = Genre(rawValue: selectedGenre) {
                Task {
                    await mangaByGenre(genre: genre)
                }
            }
            //willSet -> valor de justo antes de cambiar
            
        }
    }
    
    let mangaInteractor: MangaInteractorProcotocol
    
    var page = 1
    
    
    init(mangaInteractor: MangaInteractorProcotocol = MangaInteractor()) {
        self.mangaInteractor = mangaInteractor
        
        Task { await getManga()}
    }
    
    func getManga() async {
        do {
            print("Llamada a la red")
            
            let manga = try await mangaInteractor.getManga(page: page )
            
            await MainActor.run {
                mangas += manga
                print(page)
                print(mangas.count)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //Paginación
    
    func lastItem(manga: Manga) -> Bool {
        mangas.last?.id == manga.id
    }
    
    func nextPage(manga: Manga) {
        if lastItem(manga: manga) {
            page += 1
            Task {
                searchText.isEmpty ? await getManga() : await searchMangas()
            }
        }
    }
    
    //Barra de búsqueda
    
    func searchMangas() async {
        if !searchText.isEmpty {
            do {
                if page == 1 {
                    await MainActor.run {
                        mangas.removeAll()
                    }
                }
                let manga = try await mangaInteractor.searchManga(page: page, contain: searchText)
                
                await MainActor.run {
                    mangas += manga
                }
            } catch {
                print(error)
            }
            
        } else {
            await MainActor.run {
                mangas.removeAll()
            }
            page = 1
            await getManga()
        }
    }
    
    //Filtro por Género
    
    func mangaByGenre(genre: Genre) async -> [Manga] {
        if !selectedGenre.isEmpty {
            do {
                
                let manga = try await mangaInteractor.mangaByGenre(genre: genre)
                
                await MainActor.run {
                    if page == 1 {
                        mangas.removeAll()
                    }
                    mangas += manga
                }
                    
                } catch {
                    print(error)
                }
            
        }else {
            await MainActor.run {
                mangas.removeAll()
            }
            await getManga()
            page = 1
            selectedGenre = ""
        }
        return []
    }
    
    
    
    func toogleFavorites(favoriteManga: Manga) {
        if let index = mangas.firstIndex(where: { $0.id == favoriteManga.id }) {
            mangas[index].isFavorite.toggle()
            saveFavorites()
        }
    }
    
    
    //Persistencia de datos
    
    func saveFavorites() {
        //cargo los favoritos para que se actualicen con los nuevos favoritos y no sobrescriba los favoritos
        //        var actualFavorites = loadFavorites()
        //        let updateManga = manga.filter { $0.isFavorite}
        //        actualFavorites.append(contentsOf: updateManga)
        let  actualFavorites = mangas.filter { $0.isFavorite}
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonFavorites = try encoder.encode(actualFavorites)
            if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("favorites.json") {
                try jsonFavorites.write(to: fileURL, options: .atomic)
                print(fileURL)
            }
        } catch {
            print(error)
        }
    }
    
    func loadFavorites() -> [Manga]{
        if let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("favorites.json"){
            do {
                let data = try Data(contentsOf: fileURL)
                return try JSONDecoder().decode([Manga].self, from: data)
            } catch {
                print(error)
            }
        }
        return []
    }
    
    
}

