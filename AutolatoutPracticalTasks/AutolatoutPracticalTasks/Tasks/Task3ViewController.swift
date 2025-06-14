//
//  Task3ViewController.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import UIKit
import Combine

// Lay out login screen as in the attached screen recording.
// 1. Content should respect safe area guides
// 2. Content should be visible on all screen sizes
// 3. Content should be spaced on bottom as in the recording
// 4. When keyboard appears, content should move up
// 5. When you tap the screen and keyboard gets dismissed, content should move down
// 6. You can use container views/layout guides or any option you find useful
// 7. Content should have horizontal spacing of 16
// 8. Title and description labels should have a vertical spacing of 12 from each other
// 9. Textfields should have a spacing of 40 from top labels
// 10. Login button should have 16 spacing from textfields
final class Task3ViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    let usernameField = UITextField()
    let passwordField = UITextField()
    let logInButton = UIButton(type: .system)
    
    private var keyboardCancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addViews()
        layoutView()
        keyboard()
        gestures()
    }

    private func addViews() {
        titleLabel.text = "Sign In"
        titleLabel.font = .boldSystemFont(ofSize: 32)

        bodyLabel.text = """
        text text text тут типо что то важное написано и тд
        а может и не важное, просто текст
        очень важный текст
        """
        bodyLabel.numberOfLines = 0
        bodyLabel.font = .systemFont(ofSize: 16)

        //textfield
        usernameField.placeholder = "Enter username"
        passwordField.placeholder = "Enter password"
        usernameField.borderStyle = .roundedRect
        passwordField.borderStyle = .roundedRect

        //кнопка
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.backgroundColor = .systemBlue
        
        [scrollView].forEach { view.addSubview($0) }
        scrollView.addSubview(contentView)
        
        [titleLabel, bodyLabel, usernameField, passwordField, logInButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layoutView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            usernameField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 40),
            usernameField.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            usernameField.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor),
            
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 16),
            passwordField.leadingAnchor.constraint(equalTo: usernameField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: usernameField.trailingAnchor),
            
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }

    private func keyboard() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .sink { [weak self] notification in
                guard let self = self,
                      let userInfo = notification.userInfo,
                      let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
                      let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }

                let isKeyboardVisible = keyboardFrame.origin.y < UIScreen.main.bounds.height
                let bottomInset = isKeyboardVisible ? keyboardFrame.height - view.safeAreaInsets.bottom : 0

                UIView.animate(withDuration: duration) {
                    self.scrollView.contentInset.bottom = bottomInset
                    self.scrollView.verticalScrollIndicatorInsets.bottom = bottomInset
                }
            }
            .store(in: &cancellables)
    }

    private func gestures() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }

    @objc private func endEditing() {
        view.endEditing(true)
    }
    
    private var cancellables = Set<AnyCancellable>()
}

#Preview {
    Task3ViewController()
}
