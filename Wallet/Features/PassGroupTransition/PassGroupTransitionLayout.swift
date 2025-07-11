//
//  PassGroupTransitionLayout.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation


struct PassGroupTransitionLayout {
    static func layout(passCount: Int,
                       targetSpacing: CGFloat) -> [CGFloat] {

        // same formula you used before, but with a fixed spacing
        (0..<passCount).map { i in CGFloat(i) * targetSpacing }
    }
}
