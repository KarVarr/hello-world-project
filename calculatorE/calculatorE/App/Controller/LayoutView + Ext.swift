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
            calculatorView.label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            calculatorView.label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            calculatorView.label.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            mainStack.SV.topAnchor.constraint(equalTo: calculatorView.label.bottomAnchor, constant: 20),
            mainStack.SV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainStack.SV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainStack.SV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
