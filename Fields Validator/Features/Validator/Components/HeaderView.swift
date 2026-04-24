//
//  HeaderView.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 24/04/26.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Image("top_image")
                .resizable()
                .scaledToFit()
                .frame(width: 96, height: 96)
                .padding(18)
                .background(.regularMaterial, in: .rect(cornerRadius: 30, style: .continuous))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 8) {
                Text("Native Regex validation")
                    .font(.largeTitle.bold())

                Text("A compact SwiftUI form using Observation, derived validation state, and iOS 26 glass styling.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    HeaderView()
        .padding()
}
