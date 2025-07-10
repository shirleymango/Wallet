//
//  ContentView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var selectedCardIndex: Int? = nil

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    Text("Wallet")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)

                    CascadingCardsView(
                        spacing: 50,
                        cardHeight: 220,
                        selectedCardIndex: $selectedCardIndex,
                        animation: animation
                    )
                }
                .padding()
            }

            // Overlay full screen detail view when a card is selected
            if let index = selectedCardIndex {
                CardDetailViewWithAnimation(
                    cardIndex: index,
                    selectedCardIndex: $selectedCardIndex,
                    animation: animation
                )
                .zIndex(1)
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: selectedCardIndex)
    }
}
