//
//  MangasTabView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct MangasTabView: View {
    @EnvironmentObject var mangasVM : MangasViewModel
    
    var body: some View {
        TabView {
            
            MangasBDListView()
                .tabItem {
                    Label("BD Mangas", systemImage: "books.vertical.fill")
                }
            
            MisMangasGridView()
                .tabItem {
                    Label("Mis mangas", systemImage: "star.fill"
                    )
                }
        }
    }
}

#Preview {
    MangasTabView( )
        .environmentObject(MangasViewModel())
}
