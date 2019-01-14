//
//  TextField+Ext.swift
//  Email and Password Validator
//
//  Created by Leonardo Bilia on 1/14/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setRoundedBorders(color: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = 22
        self.clipsToBounds = true
    }
    
    func setLeftPadding(_ size:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(_ size:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
