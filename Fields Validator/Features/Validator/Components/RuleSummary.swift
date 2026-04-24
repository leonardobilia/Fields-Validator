//
//  RuleSummary.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 24/04/26.
//

import SwiftUI

struct RuleSummary: View {
    let form: ValidatorForm

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RuleRow(title: "Email format", isValid: form.isEmailValid)
            RuleRow(title: "Password length", isValid: form.isPasswordValid)
        }
        .font(.footnote)
    }
}

private struct RuleRow: View {
    let title: String
    let isValid: Bool

    var body: some View {
        Label(title, systemImage: isValid ? "checkmark.circle.fill" : "circle")
            .foregroundStyle(isValid ? .green : .secondary)
    }
}

#Preview {
    RuleSummary(form: ValidatorForm())
        .padding()
}
