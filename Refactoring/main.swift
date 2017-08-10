//
//  main.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 08/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

import Foundation

let movie1 = Movie(title: "movie1", priceCode: Movie.CHILDRENS)
let movie2 = Movie(title: "movie2", priceCode: Movie.REGULAR)
let movie3 = Movie(title: "movie3", priceCode: Movie.NEW_RELEASE)

let rental1 = Rental(movie: movie1, daysRented: 3)
let rental2 = Rental(movie: movie2, daysRented: 1)
let rental3 = Rental(movie: movie3, daysRented: 3)

let customer = Customer(name: "MOA")
customer.addRental(rental: rental1)
customer.addRental(rental: rental2)
customer.addRental(rental: rental3)

let customerStatement = customer.statement()
print(customerStatement)
