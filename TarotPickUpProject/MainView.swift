//
//  ContentView.swift
//  TarotPickUpProject
//
//  Created by Admin on 12/05/2023.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        VStack {
            horScrollCard
            //verScrollCard
        }
        .padding()
    }
    
    var horScrollCard: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<5, id: \.self) { index in
                    getCard(index)
                        .aspectRatio(2/3, contentMode: .fit)

                }
            }

        }

    }
    var verScrollCard: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<77, id: \.self) { index in
                getCard(index)
            }
        }
    }
    
    func getCard(_ index: Int) -> some View {
        VStack {
            
            Image(index < 10 ? "00\(index)" : "0\(index)")
                .resizable()
                .padding(.horizontal, 4)
                .padding(.vertical, 4)

        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(radius: 2)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
