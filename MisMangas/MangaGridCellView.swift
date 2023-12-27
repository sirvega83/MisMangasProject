//
//  MangaCellView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 17/12/23.
//

import SwiftUI

struct MangaGridCellView: View {
    let mangas: Manga
    
    var body: some View {
        ZStack {
            VStack {
                ForEach(mangas.themes, id: \.id) { theme in
                    Text(theme.theme)
                }
                
                AsyncImage(url: mangas.formattedMainPicture) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                    Text(mangas.title)
                        .font(.callout)
                } placeholder: {
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                    Text(mangas.title)
                        .font(.callout)
                }
            }
        }
        
    }
}

#Preview {
    MangaGridCellView(mangas: .testPreview)
}
