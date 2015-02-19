//
//  Calculation.swift
//  SwiftCalculator
//
//  Created by JD Maresco on 2/18/15.
//  Copyright (c) 2015 Maresco. All rights reserved.
//

import Foundation


class Calculation {

    // Results are stored as a Double
    var lastResult: Double = 0
    
    // Pending operation is stored as a custom enum
    var pendingOperation: buttonType = .none {
        
        willSet {
            
            if (lastResult == 0 && pendingOperation == .none) {
                lastResult = pendingOperand.convertToDouble()
            }
            
            if pendingOperation == .plus {
                lastResult = lastResult + pendingOperand.convertToDouble()
            } else if pendingOperation == .minus {
                lastResult = lastResult - pendingOperand.convertToDouble()
            } else if pendingOperation == .dividedBy {
                lastResult = lastResult / pendingOperand.convertToDouble()
            } else if pendingOperation == .times {
                lastResult = lastResult * pendingOperand.convertToDouble()
            }
            updateDisplay(lastResult.convertToString())
            pendingOperand = "0"
        }
    }
    
    // Operand stored as a string, but will be converted to Double during calculation
    var pendingOperand: String = "0"
    
    init() {
        
    }
    
    // Take the appropriate action based on the button pressed
    
    func registerClick(button: buttonType) {
        switch button {
            case .period:
                // TODO: This is not correct
                pendingOperand = pendingOperand + "."
                updateDisplay(pendingOperand)
            
            case .clear:
                pendingOperand = "0"
                pendingOperation = .none
                lastResult = 0
                updateDisplay(pendingOperand)
            
            case .plusMinus:
                var newValue: Double = pendingOperand.convertToDouble() * -1
                pendingOperand = newValue.convertToString()
                updateDisplay(pendingOperand)
            
            case .percent:
                var newValue: Double = 0
                if pendingOperation == .none {
                    newValue = pendingOperand.convertToDouble() / 100
                } else {
                    newValue = pendingOperand.convertToDouble() / 100 * lastResult
                }
                pendingOperand = newValue.convertToString()
                updateDisplay(pendingOperand)
            
            case .dividedBy:
                pendingOperation = .dividedBy
            case .times:
                pendingOperation = .times
            case .plus:
                pendingOperation = .plus
            case .minus:
                pendingOperation = .minus
            case .equals:
                pendingOperation = .none
            
            case .zero:
                digitPressed("0")
            case .one:
                digitPressed("1")
            case .two:
                digitPressed("2")
            case .three:
                digitPressed("3")
            case .four:
                digitPressed("4")
            case .five:
                digitPressed("5")
            case .six:
                digitPressed("6")
            case .seven:
                digitPressed("7")
            case .eight:
                digitPressed("8")
            case .nine:
                digitPressed("9")

            default:
                // should never be called, but default class required since we have a .none case that doesn't correspond to a button
                println("default!!! (this should never be called)")
        }
    }
    
    func digitPressed(digit: String) {
        if pendingOperand == "0" {
            pendingOperand = digit
        } else {
            pendingOperand = pendingOperand + digit
        }
        updateDisplay(pendingOperand)
    }
    
    func updateDisplay(contents: String) {
        let dict = ["contents":contents]
        NSNotificationCenter.defaultCenter().postNotificationName("operandChanged", object: self, userInfo: dict)
    }
    
}