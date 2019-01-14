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
        textfield.textColor = UIColor.darkGray
        textfield.textContentType = UITextContentType.emailAddress
        textfield.keyboardType = .emailAddress
        textfield.autocapitalizationType = .none
        textfield.setLeftPadding(16)
        textfield.setRightPadding(16)
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
        textfield.textColor = UIColor.darkGray
        textfield.setLeftPadding(16)
        textfield.setRightPadding(32)
        textfield.delegate = self
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 22
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.purple
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(loginHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: views
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutHandler()
        keyboardHandler()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        emailTextField.setRoundedBorders(color: UIColor.lightGray)
        passwordTextField.setRoundedBorders(color: UIColor.lightGray)
    }
    
    
    //MARK: actions
    @objc fileprivate func loginHandler() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        if email.isEmpty || !email.isValidEmail {
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
            emailTextField.setRoundedBorders(color: UIColor.red)
            
        } else if password.isEmpty || !password.isValidPassword {
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
            passwordTextField.setRoundedBorders(color: UIColor.red)
            
        } else {
            let alert = UIAlertController(title: "Success", message: "You are now logged in", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc fileprivate func returnKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    //MARK: functions
    fileprivate func keyboardHandler() {
        let tapViewGesture = UITapGestureRecognizer(target: self, action: #selector(returnKeyboard))
        view.addGestureRecognizer(tapViewGesture)
    }
    
    fileprivate func layoutHandler() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(topImageView)
        topImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topImageView.widthAnchor.constraint(equalToConstant: 152).isActive = true
        topImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 32).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        view.addSubview(signInButton)
        signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}



extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
