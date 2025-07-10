//
//  CardView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import Foundation
import SwiftUI

struct CardView: View {
    let cardHeight: CGFloat
    let card: Card

    var body: some View {
        Image(card.background)
            .resizable()
            .scaledToFill() // or .aspectRatio(contentMode: .fill)
            .frame(height: cardHeight) // just height, not maxHeight
            .frame(maxWidth: .infinity) // optional: stretch horizontally
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
    }
}

