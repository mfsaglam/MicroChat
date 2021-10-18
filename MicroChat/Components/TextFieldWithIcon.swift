//
//  TextFieldWithIcon.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 14.10.2021.
//

import SwiftUI

struct TextFieldWithIcon: View {
    var icon: String
    var placeholder: String
    var keyboardType: UIKeyboardType
    var isSecureField: Bool
    @Binding var title: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(#colorLiteral(red: 0.2901960784, green: 0.6392156863, blue: 0.7764705882, alpha: 1)))
            if !isSecureField {
                TextField(placeholder, text: $title)
                    .keyboardType(keyboardType)
            } else {
                SecureField(placeholder, text: $title)
            }
        }
        .padding()
        .frame( height: 60)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke()
                .opacity(0.25)
        )
        .padding(.horizontal, 20)
    }
}

struct TextFieldWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithIcon(icon: "envelope", placeholder: "Enter your email", keyboardType: .emailAddress, isSecureField: true, title: .constant(""))
    }
}
