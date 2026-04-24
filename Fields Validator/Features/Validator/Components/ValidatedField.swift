//
//  ValidatedField.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 24/04/26.
//

import SwiftUI

struct ValidatedField: View {

    let title: String
    let prompt: String
    let systemImage: String
    let message: String?
    let isSecure: Bool
    
    @Binding var text: String

    private var borderColor: Color {
        message == nil ? .secondary.opacity(0.25) : .red
    }

    private var foregroundStyle: Color {
        message == nil ? .secondary : .red
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: systemImage)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                field
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                validationIcon
            }
            .padding(.horizontal, 16)
            .frame(height: 54)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(borderColor, lineWidth: 1)
            }

            if let message {
                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.snappy, value: message)
    }

    @ViewBuilder
    private var field: some View {
        if isSecure {
            SecureField(prompt, text: $text)
                .textContentType(.password)
        } else {
            TextField(prompt, text: $text)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
        }
    }

    @ViewBuilder
    private var validationIcon: some View {
        if !text.isEmpty {
            Image(systemName: message == nil ? "checkmark.circle.fill" : "exclamationmark.circle.fill")
                .foregroundStyle(foregroundStyle)
                .accessibilityHidden(true)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        ValidatedField(
            title: "Email",
            prompt: "name@example.com",
            systemImage: "envelope",
            message: nil,
            isSecure: false,
            text: .constant("hello@example.com")
        )

        ValidatedField(
            title: "Password",
            prompt: "6-15 characters",
            systemImage: "lock",
            message: "Keep it between 6 and 15 characters.",
            isSecure: true,
            text: .constant("123")
        )
    }
    .padding()
}
