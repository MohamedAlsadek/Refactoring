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
            // add frequent renter points
            frequentRenterPoints += 1
            
            // add bonus for a two day new release rental
            if rental.movie.priceCode == Movie.NEW_RELEASE && rental.daysRented > 1 {
                frequentRenterPoints += 1
                
                // show figures for this rental
                result += "\t \(rental.movie.title) \t \(rental.getCharge()) \n"
                
                totalAmount += rental.getCharge()
            }
        }
        
        // add footer line
        result += "Amount owed is \(totalAmount) \n"
        result += "You earned \(frequentRenterPoints) frequent renter points"
        
        return result
    }
    
}
