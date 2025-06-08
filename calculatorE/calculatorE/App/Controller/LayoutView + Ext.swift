//
//  LayoutView + Ext.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

extension ViewController {
    func layoutView() {
        NSLayoutConstraint.activate([
            calculatorView.label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            calculatorView.label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculatorView.label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculatorView.label.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            mainStack.SV.topAnchor.constraint(equalTo: calculatorView.label.bottomAnchor, constant: 20),
            mainStack.SV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.SV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStack.SV.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])
    }
}
