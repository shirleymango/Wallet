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
            .frame(height: passHeight) // just height, not maxHeight
            .frame(maxWidth: .infinity) // optional: stretch horizontally
            .clipped()
            .shadow(radius: 4)
    }
}
