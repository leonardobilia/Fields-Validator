//
//  ValidatorForm.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 23/08/20.
//

import Observation

@Observable
final class ValidatorForm {

    var email = ""
    var password = ""

    var isEmailValid: Bool {
        ValidationRule.email.matches(email)
    }

    var isPasswordValid: Bool {
        ValidationRule.password.matches(password)
    }

    var canSubmit: Bool {
        isEmailValid && isPasswordValid
    }

    var emailMessage: String? {
        guard !email.isEmpty, !isEmailValid else { return nil }
        return "Use a valid email address."
    }

    var passwordMessage: String? {
        guard !password.isEmpty, !isPasswordValid else { return nil }
        return "Keep it between 6 and 15 characters."
    }
}
