//
//  MessagesView.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 15.10.2021.
//

import SwiftUI

struct MessagesView: View {
    @State var messages = ["The beauty of the sunset was obscured by the industrial cranes.",
                           "He was the only member of the club who didn't like plum pudding.",
                           "The tattered work gloves speak of the many hours of hard labor he endured throughout his life.",
                           "I am never at home on Sundays.",
                           "It would have been a better night if the guys next to us weren't in the splash zone.",
                           "I became paranoid that the school of jellyfish was spying on me.",
                           "If I don’t like something, I’ll stay away from it.",
                           "Red is greener than purple, for sure.",
                           "He had reached the point where he was paranoid about being paranoid.",
                           "I used to live in my neighbor's fishpond, but the aesthetic wasn't to my taste.",
                           "The child’s favorite Christmas gift was the large box her father’s lawnmower came in.",
                           "The beauty of the African sunset disguised the danger lurking nearby.",
                           "She wanted to be rescued, but only if it was Tuesday and raining.",
                           "She only paints with bold colors; she does not like pastels.",
                           "I’m a living furnace."
    ]
    
    @State var message: String = ""
    var body: some View {
        VStack {
            Text("April 04, 2021")
                .bold()
            .opacity(0.4)
            if #available(iOS 15.0, *) {
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messages, id: \.self) { message in
                            LazyVStack(alignment: .leading) {
                                Text(message)
                                    .foregroundColor(Color.black)
                                    .padding()
                                    .background(Color(#colorLiteral(red: 0.9593952298, green: 0.9594177604, blue: 0.959405601, alpha: 1)))
                                    .clipShape(MessageBubble(radius: 15, corners: [.topRight, .bottomLeft, .bottomRight]))
                                    .padding(.horizontal)
                                    .id(message)
                            }
                        }
                    }
                    .onAppear {
                        proxy.scrollTo(messages.last, anchor: .bottom)
                    }.onChange(of: messages.count) { index in
                        withAnimation(.spring()) {
                            proxy.scrollTo(messages.last, anchor: .bottom)
                        }
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    TextField("Write your message here...",text: $message)
                        .lineLimit(nil)
                        .padding(15)
                        .background(.regularMaterial, in: Capsule())
                        .overlay(
                            HStack {
                                Spacer()
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 60)
                                    .overlay(
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 20, weight: .bold))
                                    )
                                    .onTapGesture {
                                        if !message.isEmpty {
                                            messages.append(message)
                                        }
                                        message = ""
                                    }
                            }
                        )
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
