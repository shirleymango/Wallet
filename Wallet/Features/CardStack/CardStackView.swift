//
//  CardStackView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/10/25.
//

import Foundation
import SwiftUI

struct CardStackView: View {
    @Binding var selectedIndex: Int?
    let cards: [Card]
    let scroll: CGFloat
    let namespace: Namespace.ID

    var body: some View {
        let meta = CardStackLayout.layout(
            cardCount: cards.count,
            baseSpacing: 50,
            scroll: scroll)

        ZStack(alignment: .top) {
            ForEach(cards.indices, id: \.self) { i in
                CardView(cardHeight: 220, card: cards[i])
                    .matchedGeometryEffect(
                        id: i,
                        in: namespace,
                        isSource: selectedIndex == nil
                    )
                    .onTapGesture { selectedIndex = i }
                    .offset(y: meta.offsets[i])
                    .padding(.horizontal)
            }
        }
        .frame(height: meta.height)
        .offset(y: -meta.centerShift)
    }
}

