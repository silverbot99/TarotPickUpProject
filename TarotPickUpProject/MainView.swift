//
//  ContentView.swift
//  TarotPickUpProject
//
//  Created by Admin on 12/05/2023.
//

import SwiftUI

struct MainView: View {

    var cards : [Card] = {
        let allMainCard = MainCard.allCases
        let allRanks = Rank.allCases
        var main = allMainCard.map { mainCard in
            Card(suit: Suit.Main, main: mainCard)
        }
        let cups = allRanks.map { rank in
            Card(rank: rank, suit: Suit.Cup)
        }
        let pentancles = allRanks.map { rank in
            Card(rank: rank, suit: Suit.Pentacle)
        }
        let swords = allRanks.map { rank in
            Card(rank: rank, suit: Suit.Sword)
        }
        let wands = allRanks.map { rank in
            Card(rank: rank, suit: Suit.Wand)
        }
        var result: [Card] = []
//        result.append(contentsOf: main)
//        result.append(contentsOf: cups)
//        result.append(contentsOf: pentancles)
//        result.append(contentsOf: swords)
        result.append(contentsOf: wands)
        return result
    }()
    
    @State var chosenCard: Card = Card(suit: .Main)
    @State private var offsetY: CGFloat = 0

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: -76)]) {
                    
                    ForEach(0..<cards.count, id: \.self) { i in
                        
                        Button {
                            chosenCard = cards[i]
                            print("card: \(cards[i])")
                        }label: {
                            CardView(card: cards[i])
                                .offset(y: offsetY)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            // Update the offsetY based on the drag translation
                                            offsetY = value.translation.height
                                        }
                                        .onEnded { _ in
                                            // Reset the offsetY after the drag ends
                                            offsetY = 0
                                        }
                                )
                        }
                    }
                }

            }

            //verScrollCard
            
            Spacer()

            CardView(card: chosenCard)
                
            Spacer()
        }
        .padding()
    }
    var verScrollCard: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<cards.count, id: \.self) { index in
                Button {
                    chosenCard = cards[index]
                }label: {
                    CardView(card: cards[index])
                }
            }
        }
    }
    
    
}

struct CardView: View {
    let card: Card
    
    var body: some View {
        
        VStack {
            
            Image(card.filename)
                .resizable()
                .padding(.horizontal, 4)
                .padding(.vertical, 4)

        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(radius: 2)
        )
        .aspectRatio(2/3, contentMode: .fit)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
