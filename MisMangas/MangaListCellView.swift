//
//  MangaListCellView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct MangaListCellView: View {
    
    let manga: Mangas
    
    @State var circleAnimation = false
    
    var body: some View {
        HStack {
            AsyncImage(url: manga.formattedMainPicture) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                
            } placeholder: {
                Image(systemName: "books.vertical.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
            }
            VStack {
                Text(manga.titleEnglish ?? "")
                    .font(.headline)
                Text(manga.title)
                    .font(.body)
            }
            Spacer()
            ScoreCircleView(manga: manga)
                .padding(.trailing, 5)
            
        }
    }
}

#Preview {
    MangaListCellView(manga: .testPreview)
}
