//
//  Movie.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 08/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

import Cocoa

class Movie: NSObject {
    
    static let CHILDRENS = 2
    static let REGULAR = 0
    static let NEW_RELEASE = 1
    
    private var price: Price?
    
    var title: String
    
    init(title: String, priceCode: Int) {
        self.title = title
        super.init()
        
        setPriceCode(priceCode: priceCode)
    }
    
    func setPriceCode(priceCode: Int) {
        switch priceCode {
        case Movie.REGULAR:
           price = RegularPrice()
            
        case Movie.NEW_RELEASE:
            price = NewReleasePrice()
            
        case Movie.CHILDRENS:
            price = ChildrensPrice()
            
        default:
            assertionFailure("Invalid price code")
            break
        }
    }
    
    func getCharge(daysRented: Int) -> Double {
        guard let price = price else {
            return 0.0
        }
        return price.getCharge(daysRented: daysRented)
    }
    
    func getFrequentRenterPoints(daysRented: Int) -> Int {
        if (price?.getPriceCode() == Movie.NEW_RELEASE && daysRented > 1) {
            return 2
        } else {
            return 1
        }
    }
}
