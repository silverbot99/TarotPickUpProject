//
//  MoneyViewModel.swift
//  DraftProject_ProblemSloving_SwiftUI
//
//  Created by Admin on 21/02/2023.
//

import Foundation

final class MoneyData {
    private init(){}
    
    static var shared: MoneyData = {
        let instance = MoneyData()
         return instance
    }()
    
    private var currentBalance: Int?
    
    func getCurrentBalance() -> Int {
        return self.currentBalance ?? 0
    }
    
    func setCurrentBalance(_ balance: Int) {
        self.currentBalance = balance
    }
}
