//
//  CardDetailRouter.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/10/25.
//

import SwiftUI

struct CardDetailRouter: View {
    let cardIndex: Int
    let onDismiss: () -> Void
    let namespace: Namespace.ID
    @State private var path: [Transaction] = []

    var body: some View {
        ZStack(alignment: .topLeading) {
            CardDetailView(cardIndex: cardIndex,
                           path: $path,
                           namespace: namespace,
                           onDismiss: onDismiss)
            // The card itself sits inside CardDetailView
        }
    }
}
