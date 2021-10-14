//
//  ContentView.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 14.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    var body: some View {
        VStack {
            Text("Welcome to MicroChat!")
                .bold()
                .padding(.bottom, 30)
            TextFieldWithIcon(icon: "envelope", placeholder: "Enter your email", title: $email)
            TextFieldWithIcon(icon: "lock", placeholder: "Enter your password", title: $email)
            Text("I forgot my password.")
                .bold()
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .padding(.vertical, 30)
            MainButton(title: "Log in")
            HStack {
                Text("Don't have an account?")
                    .font(.footnote)
                    .foregroundColor(Color(.black))
                .padding(.top, 30)
                Text("Register")
                    .bold()
                    .font(.footnote)
                    .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .padding(.top, 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


