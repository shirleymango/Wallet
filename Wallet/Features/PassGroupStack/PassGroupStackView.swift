//
//  PassGroupStackView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation
import SwiftUI

struct PassGroupStackView: View {
    @Binding var selectedIndex: Int?
    let passGroups: [PassGroup]
    let namespace: Namespace.ID
    
    var body: some View {
        let meta = PassGroupStackLayout.layout(
            passCount: passGroups.count,
            spacing: 50
        )
        ZStack(alignment: .top) {
            ForEach(passGroups.indices, id: \.self) { i in
                PassGroupView(passGroupHeight: 300,
                              passGroup: passGroups[i],
                              namespace: namespace
                )
                .onTapGesture { selectedIndex = i }
                .offset(y: meta.offsets[i])
                .padding(.horizontal)
            }
        }
        .frame(height: meta.height)
        .offset(y: -meta.offsets.last! / 2)
    }
}
