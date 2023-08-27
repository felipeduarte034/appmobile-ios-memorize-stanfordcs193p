//
//  ContentView.swift
//  App Mobile Memorize StanfordCS193p
//
//  Created by Felipe Duarte on 27/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView(isFaceUp: true)
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View{
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(style: StrokeStyle(lineWidth: 2))
                Text("👀").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
