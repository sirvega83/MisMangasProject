//
//  VolumesListView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 6/1/24.
//

import SwiftUI

struct VolumesListView: View {
    @ObservedObject var mangasVM: MangasViewModel
    let mangas: Manga

  
    
    var body: some View {
        
        List {
            ForEach(1...mangas.wrappedVolume, id: \.self) { volume in
                HStack{
                    Text("Volumen \(volume)")
                        .padding(.leading, 15)
                    
                    Spacer()
                    
                    VStack{
                        Button(action: {
                            mangasVM.isPurchased.toggle()
                        }, label: {
                            if mangasVM.isPurchased {
                                Image(systemName: "cart.fill")
                            } else {
                                Image(systemName: "cart")
                            }
                        })
                        if mangasVM.isPurchased {
                            Text("Comprado")
                                .font(.system(size: 10))
                        } else {
                            Text("Comprar")
                                .font(.system(size: 10))
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            mangasVM.isRead.toggle()
                        }, label: {
                            if mangasVM.isRead {
                                Image(systemName: "eye.fill")
                            } else {
                                Image(systemName: "eye")
                            }
                        })
                        if mangasVM.isRead {
                            Text("Leido")
                                .font(.system(size: 10))
                        } else {
                            Text("Por leer")
                                .font(.system(size: 10))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    VolumesListView(mangasVM: .localTestMangas, mangas: .testPreview)
}
