//
//  ChatView.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 15.10.2021.
//

import SwiftUI

struct ChatView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
//            HStack {
//                Image(systemName: "arrow.left")
//                    .font(.system(size: 20, weight: .bold))
//                    .onTapGesture {
//                        presentationMode.wrappedValue.dismiss()
//                    }
//                Spacer()
//                Text("Conversations with Matilda")
//                    .bold()
//                    .lineLimit(1)
//                    .padding(.trailing, 30)
//                Spacer()
//            }
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 45, weight: .regular))
                Spacer()
                Text("User Detail")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .foregroundColor(Color.white)
                    .background(
                        Color.blue
                    ).clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .padding(.trailing, 40)
                Spacer()
            }

            MessagesView()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .bold))
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Conversations with Matilda")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}
