//
//  MangaListCellView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct MangaListCellView: View {
    @EnvironmentObject var mangasVM: MangasViewModel
    
    let mangas: Manga
    
    @State var circleAnimation = false

    
    var body: some View {
        HStack {
            AsyncImage(url: mangas.formattedMainPicture) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .purple, radius: 5)
                
            } placeholder: {
                Image(systemName: "books.vertical.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
            }
            VStack {
                Text(mangas.title)
                    .font(.body)
                Text(mangas.titleEnglish ?? "")
//                ForEach(mangas.genres) { genre in
//                    Text(genre.genre.rawValue)
//                }

            }
            
            Spacer()
            
            if mangas.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            ScoreCircleView(manga: mangas)
                .padding(.trailing, 5)
            
        }
    }
}

#Preview {
    MangaListCellView(mangas: .testPreview)
        .environmentObject(MangasViewModel())
}
