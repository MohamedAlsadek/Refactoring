//
//  Customer.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 08/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

import Cocoa

class Customer: NSObject {
    
    let name: String
    private var rentals = [Rental]()
    
    init(name: String) {
        self.name = name
    }
    
    func addRental(rental: Rental) {
        rentals.append(rental)
    }
    
    func statement() -> String {
        var totalAmount = 0.0
        var frequentRenterPoints = 0
        
        var result = "Rental Recrod for \(name) \n"
        for rental in rentals {
            let thisAmount = amountFor(rental: rental)
            
            // add frequent renter points
            frequentRenterPoints += 1
            
            // add bonus for a two day new release rental
            if rental.movie.priceCode == Movie.NEW_RELEASE && rental.daysRented > 1 {
                frequentRenterPoints += 1
                
                // show figures for this rental
                result += "\t \(rental.movie.title) \t \(thisAmount) \n"
                
                totalAmount += thisAmount
            }
        }
        
        // add footer line
        result += "Amount owed is \(totalAmount) \n"
        result += "You earned \(frequentRenterPoints) frequent renter points"
        
        return result
    }
    
    private func amountFor(rental: Rental) -> Double {
        
        var thisAmount = 0.0
        
        switch rental.movie.priceCode {
        case Movie.REGULAR:
            thisAmount += 2
            if rental.daysRented > 2 {
                thisAmount += Double(rental.daysRented - 2) * 1.5
            }
            
        case Movie.NEW_RELEASE:
            thisAmount += Double(rental.daysRented) * 3.0
            
        case Movie.CHILDRENS:
            thisAmount += 1.5
            if rental.daysRented > 3 {
                thisAmount += Double(rental.daysRented - 3) * 1.5
            }
        default:
            break
        }
        
        return thisAmount
    }
    
}
