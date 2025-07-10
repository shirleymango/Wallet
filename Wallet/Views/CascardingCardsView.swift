//
//  CascadingCardsView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import SwiftUI

struct CascadingCardsView: View {
    // ---------- Inputs ----------
    let cardCount  = SampleCardData.cards.count
    let spacing:    CGFloat          // max fan-out spacing (e.g. 50)
    let cardHeight: CGFloat          // fixed height of a card

    @Binding var selectedCardIndex: Int?
    var animation:   Namespace.ID
    var scrollOffset: CGFloat        // passed in from ContentView
    // --------------------------------

    var body: some View {

        // 1. Live spacing as we scroll
        let collapsedSpacing: CGFloat = 0
        let currentSpacing  = max(collapsedSpacing,
                                  spacing - scrollOffset * 0.3)

        // 2. How many cards are still separated (y > 0)?
        //    If currentSpacing hits 0, every card is piled.
        let floatingCount: Int = {
            guard currentSpacing > 0 else { return 0 }
            let cardsAlreadySnapped = Int(scrollOffset / currentSpacing)
            return max(0, (cardCount - 1) - cardsAlreadySnapped)
        }()

        // 3. Exact container height
        let dynamicHeight = cardHeight
                          + currentSpacing * CGFloat(floatingCount)

        // 4. Exact upward shift to centre the fan
        let centerOffset  = currentSpacing * 0.5 * CGFloat(floatingCount)

        // -------------------- UI --------------------
        ZStack(alignment: .top) {
            ForEach(0..<cardCount, id: \.self) { index in
                let initialOffset = CGFloat(index) * currentSpacing
                let clampedOffset = max(0, initialOffset - scrollOffset)

                CardView(cardHeight: cardHeight,
                         card: SampleCardData.cards[index])
                    .matchedGeometryEffect(id: index, in: animation)
                    .onTapGesture { selectedCardIndex = index }
                    .offset(y: clampedOffset)
            }
        }
        .frame(height: dynamicHeight)     // tell the parent exactly how tall we are
        .offset(y: -centerOffset)         // centre the fan within that height
    }
}
