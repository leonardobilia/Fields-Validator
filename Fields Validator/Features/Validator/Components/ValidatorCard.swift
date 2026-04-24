//
//  ValidatorCard.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 24/04/26.
//

import SwiftUI

struct ValidatorCard: View {

    @Bindable var form: ValidatorForm
    
    let submit: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 16) {
                ValidatedField(
                    title: "Email",
                    prompt: "name@example.com",
                    systemImage: "envelope",
                    message: form.emailMessage,
                    isSecure: false,
                    text: $form.email
                )

                ValidatedField(
                    title: "Password",
                    prompt: "6-15 characters",
                    systemImage: "lock",
                    message: form.passwordMessage,
                    isSecure: true,
                    text: $form.password
                )
            }

            RuleSummary(form: form)

            Button(action: submit) {
                Label("Sign In", systemImage: "checkmark.seal.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.glassProminent)
            .disabled(!form.canSubmit)
        }
        .padding(22)
        .glassSurface(cornerRadius: 30)
    }
}

#Preview {
    ValidatorCard(form: ValidatorForm(), submit: {})
        .padding()
}
