//
//  ConversationsView.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 18.10.2021.
//

import SwiftUI

struct ConversationsView: View {
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9656175971, green: 0.9692887664, blue: 0.984508574, alpha: 1))
                .ignoresSafeArea()
            VStack {
                ConversationsControlPanel()
                ScrollView {
                    ForEach(0 ..< 5) { item in
                        NavigationLink(destination: ChatView()) {
                            ConversationBubble()
                                .padding(.horizontal, 30)
                            .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 10)
                        }
                    }
                }
                .padding(.bottom, 73)
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
        .navigationTitle("Conversations")
        .navigationBarBackButtonHidden(true)
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConversationsView()
        }
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

struct ConversationsControlPanel: View {
    var segments = ["Active", "Archived"]
    @State var selectedSegment = "Active"
    @Namespace var segmentNamespace
    var body: some View {
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
        .padding(.top)
    }
}

struct ConversationBubble: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                Text("1")
                    .foregroundColor(Color(#colorLiteral(red: 0.8549019608, green: 0.2392156863, blue: 0.0862745098, alpha: 1)))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color(#colorLiteral(red: 0.8549019608, green: 0.2392156863, blue: 0.0862745098, alpha: 1)).opacity(0.3))
                    )
            }
            .padding()
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Huo Shu")
                            .fontWeight(.semibold)
                        Text("1 day")
                            .foregroundColor(Color(#colorLiteral(red: 0.3176470588, green: 0.2823529412, blue: 0.6980392157, alpha: 1)))
                    }
                    Spacer()
                    Image(systemName: "checkmark")
                        .foregroundColor(Color(#colorLiteral(red: 0.3124988973, green: 0.292444706, blue: 0.7242618203, alpha: 1)))
                        .padding(10)
                        .background(Color(#colorLiteral(red: 0.3124988973, green: 0.292444706, blue: 0.7242618203, alpha: 1)).opacity(0.3))
                        .clipShape(Circle())
                }
                Text("Hello, I can't find my crenditial in the app can you help me with finding it because it is driving me crazy so much.")
                    .opacity(0.5)
                    .lineLimit(2)
                    .padding(.top, 12)
            }
        }
        .padding(20)
        .background(
            Color.white
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}
