//
//  Extensions.swift
//  Email and Password Validator
//
//  Created by Leonardo Bilia on 1/14/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}" //Email
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordRegEx = "^.{6,15}$" //Password length 6-15
        return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: self)
    }
}
