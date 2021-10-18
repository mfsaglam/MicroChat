//
//  MainButton.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 14.10.2021.
//

import SwiftUI

struct MainButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .padding(.horizontal, 70)
            .foregroundColor(Color.white)
            .padding()
            .frame( height: 60)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color(#colorLiteral(red: 0.2901960784, green: 0.6392156863, blue: 0.7764705882, alpha: 1)))
            )
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Button")
    }
}
