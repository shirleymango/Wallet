//
//  CascadingCardsView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import SwiftUI

struct CascadingCardsView: View {
    let cardCount = SampleCardData.cards.count
    let spacing: CGFloat
    let cardHeight: CGFloat

    @Binding var selectedCardIndex: Int?
    var animation: Namespace.ID
    var scrollOffset: CGFloat

    var body: some View {
        // Dynamically reduce spacing as you scroll
        let collapsedSpacing: CGFloat = 0
        let currentSpacing = max(collapsedSpacing, spacing - scrollOffset * 0.3)
        let dynamicHeight = cardHeight + currentSpacing * CGFloat(cardCount - 1)
        let centerOffset = currentSpacing * 0.5 * CGFloat(cardCount - 1)

        ZStack(alignment: .top) {
            ForEach(0..<cardCount, id: \.self) { index in
                let initialOffset = CGFloat(index) * currentSpacing
                let clampedOffset = max(0, initialOffset - scrollOffset)

                CardView(cardHeight: cardHeight, card: SampleCardData.cards[index])
                    .matchedGeometryEffect(id: index, in: animation)
                    .onTapGesture {
                        selectedCardIndex = index
                    }
                    .offset(y: clampedOffset)
            }
        }
        .frame(height: dynamicHeight)
        .offset(y: -centerOffset) // dynamically centers the fan
    }
}
