//
//  Calculator.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

struct Calculator {
    private var number: Int?
    private var calculation: (num1: Int, calc: String)?
    
    mutating func setNumber(_ number: Int) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Int? {
        if let num = number {
            if symbol == "=" {
                return performTwoNumCalculation(num2: num)
            } else {
                calculation = (num1: num, calc: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(num2: Int) -> Int? {
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

