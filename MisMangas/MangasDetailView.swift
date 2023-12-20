//
//  MangasDetailView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 19/12/23.
//

import SwiftUI

struct MangasDetailView: View {
    
    let manga: Mangas
    
    var body: some View {
        VStack {
            Text(manga.title)
                .font(.largeTitle)
                .font(.title)
            Text(manga.titleJapanese)
                .padding(.bottom, 40)
            AsyncImage(url: manga.formattedMainPicture) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Text(manga.sypnosis ?? "")
                    .font(.callout)
                    
            } placeholder: {
                Image(systemName: "books.vertical.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
            }
        }
    }
}

#Preview {
    MangasDetailView(manga: .testPreview)
}
