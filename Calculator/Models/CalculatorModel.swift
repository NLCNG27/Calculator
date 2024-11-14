//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Nguyen Lam on 11/14/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorModel {
    private var currentValue: Double? // First operand
    private var pendingOperation: String? // Stores the current operation
    
    func setOperand(_ operand: Double) {
        currentValue = operand
    }
    
    func performOperation(_ symbol: String, currentDisplayValue: Double) -> Double {
        switch symbol {
        case "+/-":
            return currentDisplayValue * -1
        case "%":
            return currentDisplayValue / 100
        case "AC":
            currentValue = 0
            pendingOperation = nil
            return 0
        case "+", "-", "x", "÷":
            pendingOperation = symbol
            currentValue = currentDisplayValue // Set the first operand
            return currentDisplayValue
        case "=":
            return calculateResult(with: currentDisplayValue)
        default:
            return currentDisplayValue
        }
    }
    
    private func calculateResult(with secondOperand: Double) -> Double {
        guard let operation = pendingOperation, let firstOperand = currentValue else {
            return secondOperand
        }
        
        // Perform the appropriate operation
        switch operation {
        case "+":
            return firstOperand + secondOperand
        case "-":
            return firstOperand - secondOperand
        case "x":
            return firstOperand * secondOperand
        case "÷":
            return firstOperand / secondOperand
        default:
            return secondOperand
        }
        
        
    }
}
