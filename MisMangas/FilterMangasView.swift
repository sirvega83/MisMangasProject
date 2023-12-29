//
//  FilterMangasView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 27/12/23.
//

import SwiftUI

struct FilterMangasView: View {
    @ObservedObject var mangasVM: MangasViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            ForEach(Genre.allCases){ genre in
                Text(genre.rawValue)
                    .onTapGesture {
                        mangasVM.selectedGenre = genre.rawValue
                        print(mangasVM.selectedGenre)
                        dismiss()
                        //Llamada a función filtrar
                    }
            }
        }
        
    }
        
}

#Preview {
    NavigationStack {
        FilterMangasView(mangasVM: .localTestMangas)
    }
}
