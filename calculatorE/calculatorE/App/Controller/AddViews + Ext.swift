//
//  AddViews + Ext.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

extension ViewController {
    func addViews() {
        let nums = [num0, num1, num2, num3, num4, num5, num6, num7, num8, num9]
        let functionalityButtons = [plusButton, minusButton, dividedButton, multiplyButton]
        view.addSubview(mainStack.SV)
        view.addSubview(calculatorView.label)
        
        nums.forEach { view.addSubview($0.button) }
        functionalityButtons.forEach { view.addSubview($0.button) }
    }
}
