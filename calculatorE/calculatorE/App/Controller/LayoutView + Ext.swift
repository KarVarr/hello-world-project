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
            resultView.label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            resultView.label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            resultView.label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            resultView.label.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            mainStack.SV.topAnchor.constraint(equalTo: resultView.label.bottomAnchor, constant: 20),
            mainStack.SV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainStack.SV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainStack.SV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
