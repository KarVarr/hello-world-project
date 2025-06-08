//
//  Calculator.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

struct Calculator {
    private var number: Double?
    private var calculation: (num1: Double, calc: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let num = number {
            if symbol == "=" {
                return performTwoNumCalculation(num2: num)
            } else if symbol == "AC"{
                return 0
            } else {
                calculation = (num1: num, calc: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(num2: Double) -> Double? {
        guard let num1 = calculation?.num1,
        let operation = calculation?.calc else { return nil }
        
        switch operation {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "×":
            return num1 * num2
        case "÷":
            return num2 != 0 ? num1 / num2 : nil
        default:
            assertionFailure("Unsupported operation: \(operation)")
            return nil
        }
    }
}

