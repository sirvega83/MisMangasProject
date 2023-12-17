//
//  MangaCellView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 17/12/23.
//

import SwiftUI

struct MangaCellView: View {
    let manga: Mangas
    
    var body: some View {
        AsyncImage(url: manga.mainPictureURL) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 130)
            Text(manga.title)
                .font(.callout)
        } placeholder: {
            Image(systemName: "popcorn")
                .resizable()
                .scaledToFit()
                .frame(width: 130)
            Text(manga.title)
                .font(.callout)
        }
    }
}

#Preview {
    MangaCellView(manga: .testPreview)
}
