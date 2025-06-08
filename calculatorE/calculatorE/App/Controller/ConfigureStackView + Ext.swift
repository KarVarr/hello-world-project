//
//  ConfigureStackView + Ext.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

extension ViewController {
    func configureStackView() {
        numberStack.SV.axis = .vertical
        numberStack.SV.spacing = 3
        numberStack.SV.distribution = .fillEqually
        
        functionalityStack.SV.axis = .vertical
        functionalityStack.SV.spacing = 3
        functionalityStack.SV.distribution = .fillEqually
        
        mainStack.SV.axis = .horizontal
        mainStack.SV.spacing = 3
        mainStack.SV.distribution = .fillProportionally
        
        mainStack.SV.addArrangedSubview(numberStack.SV)
        mainStack.SV.addArrangedSubview(functionalityStack.SV)
        
        let nums = [num1, num2, num3, num4, num5, num6, num7, num8, num9]
        let zero = num0
        let funcButtons = [plusButton, minusButton, multiplyButton, dividedButton]
        let equal = equalButton
        
        
        
        
        
        for row in 0 ..< 3 {
            let rowStack = StackViewCustom()
            rowStack.SV.axis = .horizontal
            rowStack.SV.spacing = 3
            rowStack.SV.distribution = .fillEqually
            
            for col in 0 ..< 3 {
                let index = row * 3 + col
                rowStack.SV.addArrangedSubview(nums[index].button)
            }
            
            numberStack.SV.addArrangedSubview(rowStack.SV)
        }
        
        let zeroRow = StackViewCustom()
        zeroRow.SV.axis = .horizontal
        zeroRow.SV.spacing = 3
        zeroRow.SV.distribution = .fillEqually
        zeroRow.SV.addArrangedSubview(zero.button)
        zeroRow.SV.addArrangedSubview(equal.button)
        numberStack.SV.addArrangedSubview(zeroRow.SV)
        
        funcButtons.forEach {functionalityStack.SV.addArrangedSubview($0.button)}
    }
}
