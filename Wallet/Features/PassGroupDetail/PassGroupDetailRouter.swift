//
//  PassGroupDetailRouter.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import SwiftUI

struct PassGroupDetailRouter: View {
    let passGroupIndex: Int
    let onDismiss: () -> Void

    var body: some View {
        ZStack(alignment: .topLeading) {
            PassGroupDetailView(passGroupIndex: passGroupIndex,
                           onDismiss: onDismiss)
        }
    }
}
