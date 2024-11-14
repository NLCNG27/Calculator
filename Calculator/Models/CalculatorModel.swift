//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Nguyen Lam on 11/14/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation


class CalculatorModel {
    private var currentValue: Double = 0
    
    func performOperation(_ symbol: String, currentDisplayValue: Double) -> Double {
        switch symbol {
        case "+/-":
            return currentDisplayValue * -1
        case "%":
            return currentDisplayValue / 100
        case "AC":
            currentValue = 0
            return currentValue
        default:
            return currentDisplayValue
        }
    }
}
