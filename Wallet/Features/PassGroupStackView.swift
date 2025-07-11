//
//  PassGroupStackView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation
import SwiftUI

// TODO: move passgroups to WalletHomeViewModel
struct PassGroupStackView: View {
    let passGroups = SamplePassGroupData.passGroups
    
    var body: some View {
        let meta = PassGroupStackLayout.layout(
            passCount: passGroups.count,
            spacing: 50
        )
        ZStack(alignment: .top) {
            ForEach(passGroups.indices, id: \.self) { i in
                PassGroupView(passGroupHeight: 500, passGroup: passGroups[i])
                    .offset(y: meta.offsets[i])
                    .padding(.horizontal)
            }
        }
        .frame(height: meta.height)
    }
}
