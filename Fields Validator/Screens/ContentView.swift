//
//  ContentView.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 23/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var model = ValidatorModel()
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            Image("top_image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
                .padding(32)
            
            Field(type: .email, text: $model.email, color: $model.emailStrokeColor)
                .onChange(of: model.email) { value in
                    model.validate()
                }
            
            Field(type: .password, text: $model.password, color: $model.passwordStrokeColor)
                .onChange(of: model.password) { value in
                    model.validate()
                }
            
            Button(action: { showAlert.toggle() }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Capsule().fill(Color.purple))
                    .padding(.horizontal, 24)
            }
            .disabled(model.disabled)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"), message: Text("You are now logged in"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
