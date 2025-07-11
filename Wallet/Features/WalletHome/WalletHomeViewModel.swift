//
//  WalletHomeViewModel.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/10/25.
//

import Foundation

@MainActor
final class WalletHomeViewModel: ObservableObject {
    @Published var selectedCard: Int? = nil
    @Published var scrollOffset: CGFloat = 0

    let cards: [Card] = SampleCardData.cards
    let passGroups: [PassGroup] = SamplePassGroupData.passGroups

    func onScrollChange(_ y: CGFloat) {
        scrollOffset = max(0, -y)
    }
}
