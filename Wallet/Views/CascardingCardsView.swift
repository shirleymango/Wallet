//
//  CascardingCardsView.swift
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

    var body: some View {
        let totalHeight = CGFloat(cardCount - 1) * spacing + cardHeight

        ZStack(alignment: .top) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(cardHeight: cardHeight, card: SampleCardData.cards[index])
                    .matchedGeometryEffect(id: index, in: animation)
                    .onTapGesture {
                        selectedCardIndex = index
                    }
                    .offset(y: CGFloat(index) * spacing)
            }
        }
        .frame(height: totalHeight)
        .offset(y: -CGFloat(spacing) * 0.5 * CGFloat(cardCount - 1))
    }
}
