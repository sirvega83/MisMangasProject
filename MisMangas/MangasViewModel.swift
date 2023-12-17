//
//  MangasViewModel.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 16/12/23.
//

import Foundation

final class MangasViewModel: ObservableObject {
    @Published var mangas: [Mangas] = []
    
    let mangaInteractor: MangaInteractorProcotocol
    
    init(mangaInteractor: MangaInteractorProcotocol = MangaInteractor()) {
        self.mangaInteractor = mangaInteractor
        Task { await getManga() }
    }
    
    func getManga() async {
        do {
            print("Llamada a la red")
            let manga = try await mangaInteractor.getMangaInteractor()
            
            await MainActor.run {
                mangas = manga
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
