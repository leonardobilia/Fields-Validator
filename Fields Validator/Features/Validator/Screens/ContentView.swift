//
//  ContentView.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 23/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var form = ValidatorForm()
    @State private var showsSuccess = false

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()

                ScrollView {
                    VStack(alignment: .leading, spacing: 28) {
                        HeaderView()
                        ValidatorCard(form: form, submit: submit)
                    }
                    .frame(maxWidth: 520)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 32)
                }
            }
            .navigationTitle("Fields Validator")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("Validation complete", isPresented: $showsSuccess) {
            Button("Done", role: .cancel) {}
        } message: {
            Text("Both fields match the native Swift Regex rules.")
        }
    }

    private func submit() {
        showsSuccess = true
    }
}

#Preview {
    ContentView()
}
