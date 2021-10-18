//
//  ConversationsView.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 18.10.2021.
//

import SwiftUI

struct ConversationsView: View {
    var segments = ["Active", "Archived"]
    @State var selectedSegment = "Active"
    @Namespace var segmentNamespace
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9656175971, green: 0.9692887664, blue: 0.984508574, alpha: 1))
                .ignoresSafeArea()
            VStack {
                Text("Conversations")
                    .font(.largeTitle)
                    .bold()
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .accentColor(.primary)
                            .opacity(0.5)
                            .padding(15)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    HStack {
                        ForEach(segments, id: \.self) { segment in
                            Button {
                                withAnimation(.interactiveSpring()) {
                                    selectedSegment = segment
                                }
                            } label: {
                                SegmentedControl(selectedSegment: $selectedSegment, namespace: segmentNamespace, text: segment)
                                    .accentColor(.primary)
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                        Text("Conversations")
                            .bold()
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.3124988973, green: 0.292444706, blue: 0.7242618203, alpha: 1)))
                    Spacer()
                    VStack {
                        Image(systemName: "bell.fill")
                        Text("Notifications")
                            .bold()
                    }
                    .foregroundColor(Color.secondary)
                    .overlay(
                        Text("3")
                            .foregroundColor(Color(#colorLiteral(red: 0.3124988973, green: 0.292444706, blue: 0.7242618203, alpha: 1)))
                            .font(.footnote)
                            .bold()
                            .frame(width: 30, height: 25)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color(#colorLiteral(red: 0.3124988973, green: 0.292444706, blue: 0.7242618203, alpha: 1)))
                                    .opacity(0.2)
                            )
                            .offset(y: -10)
                        ,alignment: .topLeading)
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .fill(Color.white))
                .shadow(color: .black.opacity(0.07), radius: 20, y: -30)
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}


struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}

struct SegmentedControl: View {
    @Binding var selectedSegment: String
    var namespace: Namespace.ID
    var text: String
    var body: some View {
        if selectedSegment == text {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(#colorLiteral(red: 0.3124988973, green: 0.292444706, blue: 0.7242618203, alpha: 1)))
                        .matchedGeometryEffect(id: "segmentID", in: namespace)
                )
        } else {
            Text(text)
                .opacity(0.5)
                .padding()
                .padding(.horizontal, 20)
        }
        
    }
}
