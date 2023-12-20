//
//  ContentView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 15/12/23.
//

import SwiftUI

//struct MangasBDGridView: View {
//    @ObservedObject var mangasVM : MangasViewModel
//    
//    let itemAdaptative = GridItem(.adaptive(minimum: 130))
//    
//    var body: some View {
//        
//        NavigationStack {
//            ScrollView {
//                LazyVGrid(columns: [itemAdaptative], content: {
//                    ForEach(mangasVM.mangas) { manga in
//                        MangaGridCellView(manga: manga)
//                    }
//                })
//            }
//            .navigationTitle("Biblioteca Mangas")
//            .foregroundStyle(.linearGradient(colors: [.pink.opacity(0.7), .purple.opacity(0.6), .blue.opacity(0.3)], startPoint: .leading, endPoint: .trailing))
//            .padding(10)
//        }
//        .scrollIndicators(.hidden)
//    }
//}
//
//#Preview {
//    MangasBDGridView(mangasVM: .localTestMangas)
//}
