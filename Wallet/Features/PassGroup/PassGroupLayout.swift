//
//  PassGroupLayout.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation


struct PassGroupLayout {
    static func layout(passCount: Int) -> [CGFloat] {
        let baseOffsets: [CGFloat] = [20, 10, 0]

        if passCount <= 3 {
            return baseOffsets.suffix(passCount)
        }

        var offsets = baseOffsets
        for _ in 3..<passCount {
            offsets.append(0)  // hide under the 3rd pass
        }
        return offsets
    }
}
