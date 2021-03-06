//
//  ContentView.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 14.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Welcome to MicroChat!")
                    .bold()
                    .padding(.bottom, 30)
                TextFieldWithIcon(icon: "envelope", placeholder: "Enter your email", keyboardType: .emailAddress, isSecureField: false, title: $email)
                TextFieldWithIcon(icon: "lock", placeholder: "Enter your password", keyboardType: .default, isSecureField: true, title: $password)
                Text("I forgot my password.")
                    .bold()
                    .font(.footnote)
                    .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                    .padding(.vertical, 30)
                NavigationLink(destination: ConversationsView()) {
                    MainButton(title: "Log in")
                }
                Spacer()
                Text("Don't have an account? ")
                    .font(.footnote)
                    .foregroundColor(Color(.black))
                + Text("Register")
                    .bold()
                    .font(.footnote)
                    .foregroundColor(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


