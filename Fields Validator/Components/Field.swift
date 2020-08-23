//
//  Field.swift
//  Fields Validator
//
//  Created by Leonardo Bilia on 23/08/20.
//

import SwiftUI

struct Field: View {
    
    enum FieldType {
        case email, password
    }
    
    var type: FieldType
    @Binding var text: String
    @Binding var color: Color
    
    var body: some View {
        if type == .email {
            TextField("What's your email?", text: $text)
                .autocapitalization(.none)
                .padding()
                .background(Capsule().stroke(color))
                .padding(.horizontal, 24)

        } else {
            SecureField("And your password?", text: $text)
                .padding()
                .background(Capsule().stroke(color))
                .padding(.horizontal, 24)
        }
    }
}

struct Field_Previews: PreviewProvider {
    static var previews: some View {
        Field(type: .email, text: .constant(""), color: .constant(Color(.systemGray3)))
    }
}
