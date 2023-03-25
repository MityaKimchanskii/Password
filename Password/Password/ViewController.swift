//
//  ViewController.swift
//  Password
//
//  Created by Mitya Kim on 3/23/23.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(placeHolderText: "Re-enter new password")
    let resetButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

// MARK: - Extensions
extension ViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 9
        stackView.clipsToBounds = true
        
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset password", for: [])
//        resetButton.addTarget(self, action: #selector(resetPasswordTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
        
    }
}
