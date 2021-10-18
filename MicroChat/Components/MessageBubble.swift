//
//  MessageBubble.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 14.10.2021.
//

import SwiftUI

struct MessageBubble: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(MessageBubble(radius: radius, corners: corners) )
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.")
                .foregroundColor(Color.white)
                .padding()
                .background(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .clipShape(MessageBubble(radius: 25, corners: [.topRight, .bottomRight, .bottomLeft]))
                .frame(maxWidth: 500)
                .padding(.horizontal)
            Text("Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.")
                .foregroundColor(Color.white)
                .padding()
                .background(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .clipShape(MessageBubble(radius: 25, corners: [.topRight, .bottomRight, .bottomLeft]))
                .padding(.horizontal)
            Text("Lorem ipsum dolor sit amet.")
                .foregroundColor(Color.white)
                .padding()
                .background(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .clipShape(MessageBubble(radius: 25, corners: [.topRight, .bottomRight, .bottomLeft]))
                .padding(.horizontal)
        }
    }
}
