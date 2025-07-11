//
//  PassGroupView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation
import SwiftUI

struct PassGroupView: View {
    let passGroupHeight: CGFloat
    let passGroup: PassGroup

    var body: some View {
        let meta = PassGroupLayout.layout(
            passCount: passGroup.passList.count,
        )
        ZStack(alignment: .top) {
            ForEach(passGroup.passList.indices.reversed(), id: \.self) { i in
                PassView(passHeight: passGroupHeight, pass: passGroup.passList[i])
                    .offset(y: meta[i])
                    .padding(.horizontal)
            }
        }
    }
}
