//
//  PassGroupStackLayout.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation


struct PassGroupStackLayout {

    static func layout(
        passCount: Int,
        spacing: CGFloat,
    ) -> (height: CGFloat,
          offsets: [CGFloat])
    {
        let height    = CGFloat(500) + spacing * CGFloat(passCount-1)
        let offsets   = (0..<passCount).map { i -> CGFloat in
            max(0, CGFloat(i) * spacing)
        }
        return (height, offsets)
    }
}
