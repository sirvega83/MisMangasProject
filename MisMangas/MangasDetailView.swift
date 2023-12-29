//
//  MangasDetailView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 19/12/23.
//

import SwiftUI

struct MangasDetailView: View {
    @ObservedObject var mangasVM: MangasViewModel
    let mangas: Manga
    @State var isFavorite: Bool = false
    
    
    var body: some View {
        VStack {
            Text(mangas.title)
                .font(.largeTitle)
                .font(.title)
            Text(mangas.titleJapanese ?? "")
                .padding(.bottom, 40)
            AsyncImage(url: mangas.formattedMainPicture) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)

                
                Button(action: {
                    mangasVM.toogleFavorites(favoriteManga: mangas)
                    isFavorite.toggle()
                }, label: {
                    HStack {
                        isFavorite ? Text("Añadido a favoritos") : Text("Añadir a favoritos")
                        isFavorite ? Image(systemName: "star.fill")
                        : Image(systemName: "")
                    }
                    
                    
                })

                
                Text(mangas.sypnosis ?? "")
                    .font(.callout)
                    .padding(10)
                    
            } placeholder: {
                Image(systemName: "books.vertical.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MangasDetailView(mangasVM: .localTestMangas, mangas: .testPreview)
}
