//
//  PassView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation
import SwiftUI

struct PassView: View {
    let passHeight: CGFloat
    let pass: Pass

    var body: some View {
        Image(pass.background)
            .resizable()
            .scaledToFill() // or .aspectRatio(contentMode: .fill)
            .frame(height: passHeight, alignment: .top) // just height, not maxHeight
            .frame(maxWidth: .infinity) // optional: stretch horizontally
            .clipShape(TopPartialCutoutShape())
            .shadow(radius: 4)
    }
}

struct TopPartialCutoutShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let cutoutRadius = rect.width / 10
        let centerX = rect.midX
        let centerY = rect.minY - cutoutRadius / 2

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: centerX - cutoutRadius, y: rect.minY))

        path.addArc(
            center: CGPoint(x: centerX, y: centerY),
            radius: cutoutRadius,
            startAngle: .degrees(180),
            endAngle: .degrees(0),
            clockwise: true
        )

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}
