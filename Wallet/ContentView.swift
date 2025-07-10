//
//  ContentView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import SwiftUI

// MARK: - PreferenceKey to Track Scroll Offset
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct ContentView: View {
    @Namespace private var animation
    @State private var selectedCardIndex: Int? = nil
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 8) {
                    // Invisible GeometryReader to track scroll offset
                    GeometryReader { geo in
                        Color.clear
                            .preference(
                                key: ScrollOffsetPreferenceKey.self,
                                value: geo.frame(in: .named("scroll")).minY
                            )
                    }
                    .frame(height: 0)

                    Text("Wallet")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    CascadingCardsView(
                        spacing: 50,
                        cardHeight: 220,
                        selectedCardIndex: $selectedCardIndex,
                        animation: animation,
                        scrollOffset: scrollOffset
                    )

                    Text("test") // ADDED FOR TESTING PURPOSES, TODO: REMOVE
                    PassesView() // TODO: MODIFY
                }
                .padding()
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                withAnimation(.easeInOut(duration: 0.8)) {
                    scrollOffset = max(0, value * -1)
                }
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
