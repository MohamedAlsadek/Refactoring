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
        var result = "Rental Recrod for \(name) \n"
        for rental in rentals {
            // show figures for this rental
            result += "\t \(rental.movie.title) \t \(rental.getCharge()) \n"
        }
        
        // add footer line
        result += "Amount owed is \(getTotalCharge()) \n"
        result += "You earned \(getTotalFrequentPoints()) frequent renter points"
        
        return result
    }
    
    private func getTotalCharge() -> Double {
        
        var result = 0.0
        for rental in rentals {
            result += rental.getCharge()
        }
        return result
    }
    
    private func getTotalFrequentPoints() -> Int {
        
        var result = 0
        for rental in rentals {
            // add frequent renter points
            result += rental.getFrequentRenterPoints()
        }
        
        return result
    }
    
}
