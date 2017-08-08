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
        result += "Amount owed is \(getTotalCharge() ) \n"
        result += "You earned \(getTotalFrequentPoints()) frequent renter points"
        
        return result
    }
    
     /*
     The other concern with this refactoring lies in performance. The old code executed the "while" loop once, the new code executes it three times. A while loop that takes a long time might impair performance. Many programmers would not do this refactoring simply for this reason. But note the words if and might. Until I profile I cannot tell how much time is needed for the loop to calculate or whether the loop is called often enough for it to affect the overall performance of the system. Don't worry about this while refactoring. When you optimize you will have to worry about it, but you will then be in a much better position to do something about it, and you will have more options to optimize effectively 
     */
    
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
