//
//  NewReleasePrice.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 10/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

import Cocoa

class NewReleasePrice: Price {
    
    func getPriceCode() -> Int {
        return Movie.NEW_RELEASE
    }

    func getCharge(daysRented: Int) -> Double {
        return Double(daysRented) * 3.0
    }    
}
