//
//  TextField+Ext.swift
//  Email and Password Validator
//
//  Created by Leonardo Bilia on 1/14/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import UIKit

extension UITextField {
    /**
    Set corner radius and  border to a UITextField.
     
    - Parameters:
       - color : set boder color
    
    Usage:
    ````
     emailTextField.setRoundedBorders(color: .lightGray)
    ````
    */
    func setRoundedBorders(color: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = 22
        self.clipsToBounds = true
    }
    
    /**
    Set left and/or right padding to a UITextField. It's useful when using textfields with rounded corners
     
    - Parameters:
        - left: set left padding (CGFloat)
        - right: set right padding (CGFloat)
    
    Usage:
    ````
     textfield.setPadding(left: 16, right: 16)
    ````
    */
    func setPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left = left {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        
        if let right = right {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}
