//
//  MangasViewModel.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation



final class MangasViewModel: ObservableObject {
    @Published var mangas: [Manga] = []
    @Published var searchText: String = ""
    
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
                await getManga()
            }
        }
    }
    
    //Función para buscar en la barra de búsqueda
    
    func searchMangas() -> [Manga] {
        if !searchText.isEmpty {
            mangas.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        } else {
            mangas
        }
    }
    
    
    
    func toogleFavorites(favoriteManga: Manga) {
        if let index = mangas.firstIndex(where: { $0.id == favoriteManga.id }) {
            mangas[index].isFavorite.toggle()
            saveFavorites()
        }
    }
    
   
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
