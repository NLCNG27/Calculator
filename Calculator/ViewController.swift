//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Could not convert to Double.")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue = displayValue * -1
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    if displayLabel.text!.contains(".") {
                        return  // exit if there's already a decimal
                    }
                    
                    
//                    guard let currentDisplayValue = Double(displayLabel.text!) else {
//                        fatalError("Could not convert to Double.")
//                    }
//                    
//                    let isInt = floor(currentDisplayValue) == currentDisplayValue
//                    
//                    if !isInt {
//                        return
//                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

