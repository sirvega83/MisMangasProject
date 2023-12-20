//
//  MangaCellView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 17/12/23.
//

import SwiftUI

struct MangaGridCellView: View {
    let manga: Mangas
    
    var body: some View {
        ZStack {
            VStack {
                ForEach(manga.themes, id: \.id) { theme in
                    Text(theme.theme)
                }
                
                AsyncImage(url: manga.formattedMainPicture) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                    Text(manga.title)
                        .font(.callout)
                } placeholder: {
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                    Text(manga.title)
                        .font(.callout)
                }
            }
        }
        
    }
}

#Preview {
    MangaGridCellView(manga: .testPreview)
}
