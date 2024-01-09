//
//  MangasDetailView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 19/12/23.
//

import SwiftUI

struct MangasDetailView: View {
    @EnvironmentObject var mangasVM: MangasViewModel
   
    let mangas: Manga
    @State var showVolumesList = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text(mangas.title)
                    .font(.largeTitle)
                    .font(.title)
                    .padding(10)
                Text(mangas.titleJapanese ?? "")
                    .padding(.bottom, 10)
                AsyncImage(url: mangas.formattedMainPicture) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .purple, radius: 5)
                    
                } placeholder: {
                    Image(systemName: "books.vertical.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                }
                
                Button(action: {
                    mangasVM.toogleFavorites(favoriteManga: mangas)
                    print("Hash de detailView \(mangas.hashValue)")
                }, label: {
                    if mangas.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundStyle(.purple)
                    }
                })
               
                Button(action: {
                    showVolumesList.toggle()
                }, label: {
                    VStack{
                        Image(systemName: "books.vertical.fill")
                            .foregroundStyle(LinearGradient(colors: [.yellow.opacity(0.8), .yellow.opacity(0.6), .yellow.opacity(0.3)], startPoint: .top, endPoint: .bottom))
                        Text("\(mangas.volumes ?? 1) \(mangas.volumes == 1 ? "Volumen" : "Volúmenes")")
                    }
                })
                .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                .foregroundStyle(.black)
                .background(LinearGradient(colors: [.pink.opacity(0.8), .purple.opacity(0.6), .blue.opacity(0.3)], startPoint: .leading, endPoint: .trailing), in: Capsule())
                
                
                Text(mangas.sypnosis ?? "")
                    .font(.callout)
                    .padding(10)
                
                    .navigationBarTitleDisplayMode(.large)
            }
            .sheet(isPresented: $showVolumesList, content: {
                VolumesListView(mangasVM: mangasVM, mangas: mangas)
            })
         
        }
    }
}

#Preview {
    MangasDetailView( mangas: .testPreview)
        .environmentObject(MangasViewModel())
}
