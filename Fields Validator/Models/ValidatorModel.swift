//
//  FieldsValidatorModel.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 23/08/20.
//

import SwiftUI

class ValidatorModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var emailStrokeColor = Color(.systemGray3)
    @Published var passwordStrokeColor = Color(.systemGray3)
    @Published var disabled = true
    
    func validate() {
        emailStrokeColor = Color(!email.isEmpty && !email.valid(.email) ? .systemRed : .systemGray3)
        passwordStrokeColor = Color(!password.isEmpty && !password.valid(.password) ? .systemRed : .systemGray3)
        disabled = !(email.valid(.email) && password.valid(.password))
    }
    
    func color(for validation: Bool) -> Color {
        Color(validation ? .systemGray3 : .systemRed)
    }
}
