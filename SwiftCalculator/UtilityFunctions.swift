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
    
    func convertToDouble() -> Double? {
        return (self as NSString).doubleValue
    }
}

extension Double {
    func convertToString() -> String? {
        
        // Remove trailing zeroes after decimal
        let regExSearchPattern = "([^0])(0*)$"
        let regExReplacementPattern = "$1"
        let rawConvertedValue = String(format:"%f", self)
        let convertedValue = rawConvertedValue.replaceByPattern(regExSearchPattern, withReplacementPattern: regExReplacementPattern)
        return convertedValue?
    }
}
