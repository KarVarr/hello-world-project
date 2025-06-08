//
//  ConfigureButtons + Ext.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

extension ViewController {
    func configureButtons() {
        let nums = [num0, num1, num2, num3, num4, num5, num6, num7, num8, num9]
        for (index, button) in nums.enumerated() {
            button.button.setTitle(String(index), for: .normal)
            button.button.backgroundColor = .systemBlue
            button.button.layer.cornerRadius = 2
        }
        
        plusButton.button.setTitle("+", for: .normal)
        minusButton.button.setTitle("-", for: .normal)
        dividedButton.button.setTitle("/", for: .normal)
        multiplyButton.button.setTitle("*", for: .normal)
        equalButton.button.setTitle("=", for: .normal)
        
        [plusButton, minusButton, dividedButton, multiplyButton, equalButton].forEach{
            $0.button.backgroundColor = .yellow
            $0.button.layer.cornerRadius = 2
        }
        
        equalButton.button.backgroundColor = .green
        
    }
}
