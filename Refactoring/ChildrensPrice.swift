//
//  ChildrensPrice.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 10/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

class ChildrensPrice : Price {
    
    func getPriceCode() -> Int {
        return Movie.CHILDRENS
    }

    func getCharge(daysRented: Int) -> Double {
        var thisAmount = 1.5
        if daysRented > 3 {
            thisAmount += Double(daysRented - 3) * 1.5
        }
        return thisAmount
    }
}
