//
//  UtilityFunctions.swift
//  SwiftCalculator
//
//  Created by JD Maresco on 2/16/15.
//  Copyright (c) 2015 Maresco. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func replaceByPattern(pattern: String, withReplacementPattern replacementPattern: String) -> String? {
        let regex = NSRegularExpression(pattern: pattern, options: .allZeros, error: nil)
        let range = NSMakeRange(0, countElements(self))
        
        return regex?.stringByReplacingMatchesInString(self, options: .allZeros, range: range, withTemplate: replacementPattern)
    }
    
    func convertToDouble() -> Double {
        return (self as NSString).doubleValue
    }
}

extension Double {
    func convertToString() -> String {
        
        // Remove trailing zeroes after decimal
        var regExSearchPattern = "([^0])(0*)$"
        var regExReplacementPattern = "$1"
        var rawConvertedValue = String(format:"%f", self)
        var convertedValue = rawConvertedValue.replaceByPattern(regExSearchPattern, withReplacementPattern: regExReplacementPattern)
        
        // Remove trailing decimal if present
        // NOTE: There is probably a way to combine this into one regex, but this was the fastest solution for me
        
        regExSearchPattern = "([^\\.])(\\.*)$"
        regExReplacementPattern = "$1"
        if let conv = convertedValue {
            convertedValue = conv.replaceByPattern(regExSearchPattern, withReplacementPattern: regExReplacementPattern)
        }
        
        if let result = convertedValue {
            return result
        } else {
            return ""
        }
    }
}

enum buttonType {
    case clear, plusMinus, percent, dividedBy, seven, eight, nine, times, four, five, six, minus, one, two, three, plus, zero, period, equals, none
}