//
//  Price.swift
//  Refactoring
//
//  Created by Mohamed Alsadek on 10/08/2017.
//  Copyright © 2017 Mohamed Alsadek. All rights reserved.
//

protocol Price {
    func getPriceCode() -> Int
    func getCharge(daysRented: Int) -> Double
}
