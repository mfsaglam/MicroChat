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
        path.move(to: CGPoint(x: 0.93885*width, y: 0))
        path.addLine(to: CGPoint(x: 0.07914*width, y: 0))
        path.addLine(to: CGPoint(x: 0.06115*width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2125*height))
        path.addLine(to: CGPoint(x: 0, y: 0.275*height))
        path.addLine(to: CGPoint(x: 0, y: 0.7875*height))
        path.addCurve(to: CGPoint(x: 0.06115*width, y: height), control1: CGPoint(x: 0, y: 0.90486*height), control2: CGPoint(x: 0.02738*width, y: height))
        path.addLine(to: CGPoint(x: 0.93885*width, y: height))
        path.addCurve(to: CGPoint(x: width, y: 0.7875*height), control1: CGPoint(x: 0.97262*width, y: height), control2: CGPoint(x: width, y: 0.90486*height))
        path.addLine(to: CGPoint(x: width, y: 0.2125*height))
        path.addCurve(to: CGPoint(x: 0.93885*width, y: 0), control1: CGPoint(x: width, y: 0.09514*height), control2: CGPoint(x: 0.97262*width, y: 0))
        path.closeSubpath()
        return path
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        Text("Lorem ipsum dolor sit amet.")
            .foregroundColor(Color.white)
            .padding()
            .background(Color(#colorLiteral(red: 0.2431372549, green: 0.2, blue: 0.6666666667, alpha: 1)))
            .clipShape(MessageBubble())
            .padding()
    }
}
