//
//  MessageBubble.swift
//  MicroChat
//
//  Created by Fatih Sağlam on 14.10.2021.
//

import SwiftUI

struct MessageBubble: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width*0.9, y: 0))
        path.addCurve(to: CGPoint(x: width, y: height*0.1), control1: CGPoint(x: width, y: 0), control2: CGPoint(x: width, y: height*0.1))
        path.addLine(to: CGPoint(x: width, y: height*0.9))
        path.addCurve(to: CGPoint(x: width*0.9, y: height), control1: CGPoint(x: width, y: height), control2: CGPoint(x: width*0.9, y: height))
        path.addLine(to: CGPoint(x: width * 0.1, y: height))
        path.addCurve(to: CGPoint(x: 0, y: height*0.9), control1: CGPoint(x: 0, y: height), control2: CGPoint(x: 0, y: height*0.9))
        path.closeSubpath()
        return path
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.")
                .foregroundColor(Color.white)
                .padding()
                .background(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .clipShape(MessageBubble())
                .frame(maxWidth: 500)
                .padding(.horizontal)
            Text("Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.")
                .foregroundColor(Color.white)
                .padding()
                .background(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .clipShape(MessageBubble())
                .padding(.horizontal)
            Text("Lorem ipsum dolor sit amet.")
                .foregroundColor(Color.white)
                .padding()
                .background(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
                .clipShape(MessageBubble())
                .padding(.horizontal)
        }
    }
}
