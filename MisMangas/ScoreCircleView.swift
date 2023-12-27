//
//  ScoreCircleView.swift
//  MisMangas
//
//  Created by Said Vega Ibn Rouhou on 18/12/23.
//

import SwiftUI

struct ScoreCircleView: View {
    
    let manga: Manga
    
    @State var circleAnimation = false
    
    var body: some View {
        Circle()
            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/ ,to: circleAnimation ? manga.scoreRate : 0)
            .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
            .rotation(.degrees(-90))
            .foregroundStyle(.cyan)
            .animation(.easeInOut(duration: 1.5), value: circleAnimation)
            .frame(width: 50)
            .background {
                Text("\(manga.scoreWithTwoDecimals)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(LinearGradient(colors: [.pink.opacity(0.8), .purple.opacity(0.6), .blue.opacity(0.3)], startPoint: .top, endPoint: .bottom))
            }
            .background {
                Circle()
                    .foregroundStyle(.gray)
            }
            .onAppear {
                circleAnimation = true
            }
    }
}

#Preview {
    ScoreCircleView(manga: .testPreview)
}
