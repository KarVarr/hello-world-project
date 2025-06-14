//
//  Task4ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit

// Create a view with two subviews aligned vertically when in Compact width, Regular height mode.
// If the orientation changes to Compact-Compact, same 2 subviews should be aligned horizontally.
// Hou can use iPhone 16 simulator for testing.
final class Task4ViewController: UIViewController {
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        
        addViews()
        layoutViews()
        registerForTraitChanges()
    }
    
    func addViews() {
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        view.addSubview(stackView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
        
        updateStackAxis(for: traitCollection)
    }
    
    
    func updateStackAxis(for traitCollection: UITraitCollection) {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    
    private func registerForTraitChanges() {
        let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(sizeTraits) { (self: Self, previousTraitCollection: UITraitCollection) in
            // TODO: -  Handle the trait change.
            print("Trait collection changed:", self.traitCollection)
        }
    }
}

#Preview {
    Task4ViewController()
}
