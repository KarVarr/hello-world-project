//
//  UILabelViewCustom.swift
//  calculatorE
//
//  Created by Karen Vardanian on 08.06.2025.
//

import UIKit

class UILabelViewCustom {
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.text = "0"
        return label
    }()
}
