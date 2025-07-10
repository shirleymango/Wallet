//
//  CardStackLayout.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/10/25.
//

import Foundation


struct CardStackLayout {

    static func layout(
        cardCount: Int,
        baseSpacing: CGFloat,
        scroll: CGFloat
    ) -> (spacing: CGFloat,
          height: CGFloat,
          centerShift: CGFloat,
          offsets: [CGFloat])
    {
        // 1. Live spacing
        let currentSpacing = max(0, baseSpacing - scroll * 0.3)

        // 2. All cards piled? Return quick values to avoid /0
        guard currentSpacing > 0 else {
            return (0,
                    220,                       // only cardHeight
                    0,
                    Array(repeating: 0, count: cardCount))
        }

        // 3. Cards still floating
        let floating  = max(0, cardCount - 1 - Int(scroll / currentSpacing))
        let height    = 220 + currentSpacing * CGFloat(floating)
        let shift     = currentSpacing * 0.5 * CGFloat(floating)

        let offsets   = (0..<cardCount).map { i -> CGFloat in
            max(0, CGFloat(i) * currentSpacing - scroll)
        }
        return (currentSpacing, height, shift, offsets)
    }
}
