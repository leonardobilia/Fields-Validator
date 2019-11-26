//
//  Extensions.swift
//  Email and Password Validator
//
//  Created by Leonardo Bilia on 1/14/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import UIKit

extension String {
    
    enum ValidateFieldType {
        case email, password
    }
    
    /**
    Check if the email or password address follows the RegEx specifications.
     
    - Parameters:
       - type : defined by the enum ValidateFieldType with the cases .email and .password
    
    Usage:
    ````
     if !email.valid(.email) {
         print("The email is not valid")
         return
     }
     print("The email is valid")
    ````
    */
    func valid(_ type: ValidateFieldType) -> Bool {
        switch type {
        case .email:
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
            
        case .password:
            let passwordRegEx = "^.{6,15}$"
            return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: self)
        }
    }
}
