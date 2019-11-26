//
//  ViewController.swift
//  Email and Password Validator
//
//  Created by Leonardo Bilia on 1/14/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "top_image")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "What's your email?"
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.textContentType = UITextContentType.emailAddress
        textfield.keyboardType = .emailAddress
        textfield.autocapitalizationType = .none
        textfield.setPadding(left: 16, right: 16)
        textfield.delegate = self
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "And your password?"
        textfield.textContentType = UITextContentType.password
        textfield.isSecureTextEntry = true
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = .darkGray
        textfield.setPadding(left: 16, right: 32)
        textfield.delegate = self
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 22
        button.layer.masksToBounds = true
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        keyboardHandler()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emailTextField.setRoundedBorders(color: .lightGray)
        passwordTextField.setRoundedBorders(color: .lightGray)
    }
    
    //MARK: - Methods & Functions
    
    private func keyboardHandler() {
        let tapViewGesture = UITapGestureRecognizer(target: self, action: #selector(returnKeyboard))
        view.addGestureRecognizer(tapViewGesture)
    }
    
    private func presentAlert() {
        let alert = UIAlertController(title: "Success", message: "You are now logged in", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - Actions
    
    @objc private func loginHandler() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }

        if !email.valid(.email) {
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
            emailTextField.setRoundedBorders(color: .red)
            return
        }

        if !password.valid(.password) {
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
            passwordTextField.setRoundedBorders(color: .red)
            return
        }
        
        presentAlert()
    }
    
    @objc private func returnKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}


// MARK: - UITextField Delegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UI

extension ViewController {
    
    private func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(topImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topImageView.widthAnchor.constraint(equalToConstant: 152),
            topImageView.heightAnchor.constraint(equalToConstant: 80),
            emailTextField.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 32),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            signInButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
