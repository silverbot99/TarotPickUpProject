//
//  CardGame.swift
//  TarotPickUpProject
//
//  Created by Admin on 13/05/2023.
//

import Foundation

enum Rank: CaseIterable {
 case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Page, Knight, Queen, King
    
    func text() -> String {
        return "\("\(self)".lowercased())-of-"
    }
}

enum Suit: CaseIterable {
    case Wand, Cup, Pentacle, Sword, Main
    
    func text() -> String {
        return "\("\(self)".lowercased())s-tarot-card"
    }
}

enum MainCard: CaseIterable {
    case TheFool_0, TheMagician_I, TheHighPriestess_II, TheEmpress_III, TheEmperor_IV, TheHierophant_V, TheLovers_VI
    case TheChariot_VII, Strength_VIII, TheHermit_IX, WheelOfFortune_X, Justice_XI, TheHangedMan_XII, Death_XIII
    case Temperance_XIV, Devil_XV, TheTower_XVI, TheStar_XVII, TheMoon_XVIII, TheSun_XIX, Jubgement_XX, TheWorld_XXI
    
    func text() -> String {
        let arr = "\(self)".split(separator: "_")
        if arr.count > 0 {
            return String(arr[arr.count - 1])
        }
        return ""
    }
}

struct Card {
    var rank: Rank?
    var suit: Suit
    var main: MainCard?
    var filename: String {
        if main != nil {
            return main!.text()
        }
        else {
            guard let wrappedRank = rank else { return "" }
            return "\(wrappedRank.text())\(suit.text())"
        }
    }
}
