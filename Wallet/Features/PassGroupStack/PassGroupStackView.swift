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
    
    var body: some View {
        let meta = PassGroupStackLayout.layout(
            passCount: passGroups.count,
            spacing: 50
        )
        ZStack(alignment: .top) {
            ForEach(passGroups.indices, id: \.self) { i in
                PassGroupView(passGroupHeight: 500, passGroup: passGroups[i])
                    .onTapGesture { selectedIndex = i }
                    .offset(y: meta.offsets[i])
                    .padding(.horizontal)
            }
        }
        .frame(height: meta.height)
    }
}
