//
//  ContentView.swift
//  TarotPickUpProject
//
//  Created by Admin on 12/05/2023.
//

import SwiftUI

struct MainView: View {
    let cards = [
        Card(suit: Suit.Main, main: MainCard.Death_XIII),
        Card(suit: Suit.Main, main: MainCard.TheMoon_XVIII),
        Card(suit: Suit.Main, main: MainCard.TheSun_XIX),
        Card(rank: Rank.Ace, suit: Suit.Cup),

    ]
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
                ForEach(0..<cards.count, id: \.self) { index in
                    getCard(cards[index])
                        .aspectRatio(2/3, contentMode: .fit)

                }
            }

        }

    }
    var verScrollCard: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<cards.count, id: \.self) { index in
                getCard(cards[index])
            }
        }
    }
    
    func getCard(_ card: Card) -> some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
