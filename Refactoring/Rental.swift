//
//  Rental.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 08/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

import Cocoa

class Rental: NSObject {

    let movie: Movie
    let daysRented: Int
    
    init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    func getCharge() -> Double {

        var thisAmount = 0.0
        
        switch movie.priceCode {
        case Movie.REGULAR:
            thisAmount += 2
            if daysRented > 2 {
                thisAmount += Double(daysRented - 2) * 1.5
            }
            
        case Movie.NEW_RELEASE:
            thisAmount += Double(daysRented) * 3.0
            
        case Movie.CHILDRENS:
            thisAmount += 1.5
            if daysRented > 3 {
                thisAmount += Double(daysRented - 3) * 1.5
            }
        default:
            break
        }
        
        return thisAmount
    }
}
