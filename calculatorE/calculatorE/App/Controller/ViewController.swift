//
//  ViewController.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

class ViewController: UIViewController {
    let resultView = UILabelViewCustom()
    
    let num0 = ButtonViewCustom()
    let num1 = ButtonViewCustom()
    let num2 = ButtonViewCustom()
    let num3 = ButtonViewCustom()
    let num4 = ButtonViewCustom()
    let num5 = ButtonViewCustom()
    let num6 = ButtonViewCustom()
    let num7 = ButtonViewCustom()
    let num8 = ButtonViewCustom()
    let num9 = ButtonViewCustom()
    
    let plusButton = ButtonViewCustom()
    let minusButton = ButtonViewCustom()
    let dividedButton = ButtonViewCustom()
    let multiplyButton = ButtonViewCustom()
    let equalButton = ButtonViewCustom()
    
    let numberStack = StackViewCustom()
    let functionalityStack = StackViewCustom()
    let mainStack = StackViewCustom()
    
    var calculator = Calculator()
    var currentInput: String = ""
    var isSecondNumber = false
    
    private var displayValue: Int {
        get {
            guard let number = Int(resultView.label.text ?? "0") else {
                fatalError("error")
            }
            return number
        }
        set {
            resultView.label.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        configureStackView()
        configureButtons()
        layoutView()
    }
    
    @objc func functionalityPressed(_ sender: UIButton) {
        if let symbol = sender.currentTitle {
            calculator.setNumber(displayValue)
            calculator.calculate(symbol: symbol)
            isSecondNumber = true
        }
    }
    
    @objc func numButtonPressed(_ sender: UIButton) {
        guard let numValue = sender.currentTitle else { return }
        
        if isSecondNumber {
            resultView.label.text = numValue
            isSecondNumber = false
        } else {
            if resultView.label.text == "0" || resultView.label.text == nil {
                resultView.label.text = numValue
            } else {
                resultView.label.text! += numValue
            }
        }
    }
    
    
    
    @objc func equalPressed(_ sender: UIButton) {
        calculator.setNumber(displayValue)
        if let result = calculator.calculate(symbol: "=") {
            displayValue = result
        } else {
            resultView.label.text = "error"
        }
        isSecondNumber = true
    }
    
    
}


