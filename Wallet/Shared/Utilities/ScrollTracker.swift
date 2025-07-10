//
//  ScrollTracker.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/10/25.
//

import SwiftUI

/// Reads the `minY` of its own GeometryReader (inside the named
/// coordinate space "scroll") and sends that value to `action`.
///
/// Usage:
/// ```swift
/// ScrollView {
///     // … content …
/// }
/// .coordinateSpace(name: "scroll")
/// .overlay(ScrollTracker { y in
///     viewModel.onScrollChange(y)
/// })
/// ```
struct ScrollTracker: View {

    // Called every time the scroll offset changes
    var action: (CGFloat) -> Void

    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: ScrollPrefKey.self,
                            value: geo.frame(in: .named("scroll")).minY)
        }
        .onPreferenceChange(ScrollPrefKey.self, perform: action)
        .frame(height: 0)   // invisible
    }

    // Private preference key
    private struct ScrollPrefKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
}
