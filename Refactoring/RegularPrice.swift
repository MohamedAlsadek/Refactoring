//
//  RegularPrice.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 10/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

import Cocoa

class RegularPrice: Price {
    
    func getPriceCode() -> Int {
        return Movie.REGULAR
    }
    
    func getCharge(daysRented: Int) -> Double {
        var thisAmount = 2.0
        if daysRented > 2 {
            thisAmount += Double(daysRented - 2) * 1.5
        }
        return thisAmount
    }
}
