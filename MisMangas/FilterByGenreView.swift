//
//  FilterMangasView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 27/12/23.
//

import SwiftUI

struct FilterByGenreView: View {
    @EnvironmentObject var mangasVM: MangasViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            ForEach(Genre.allCases){ genre in
                Text(genre.rawValue)
                    .padding(.leading, 40)
                    .onTapGesture {
                        mangasVM.selectedGenre = genre.rawValue
                        print(mangasVM.selectedGenre)
                        dismiss()
                    }
            }
        }
        
    }
        
}

#Preview {
    NavigationStack {
        FilterByGenreView()
            .environmentObject(MangasViewModel())
    }
}
