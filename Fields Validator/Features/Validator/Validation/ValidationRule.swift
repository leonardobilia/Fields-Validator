//
//  ValidationRule.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 23/08/20.
//

enum ValidationRule {
    case email
    case password

    func matches(_ value: String) -> Bool {
        switch self {
        case .email:
            value.wholeMatch(of: /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/) != nil
        case .password:
            value.wholeMatch(of: /^.{6,15}$/) != nil
        }
    }
}
