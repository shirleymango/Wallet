//
//  WalletHomeRouter.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/10/25.
//

import SwiftUI

/// A tiny “navigation coordinator” for the Wallet-Home feature.
///  – Owns overlay presentation (card detail, future passes detail, etc.)
///  – Owns deep-link targets if you ever support URLs / push notifications.
///  – Exposes simple `show*` / `dismiss*` helpers so the ViewModel and
///    views never manually juggle overlays or NavigationPaths.
@MainActor
final class WalletHomeRouter: ObservableObject {

    // MARK: – Screen Enum  (easy to extend later)
    enum Overlay: Hashable {
        case card(index: Int)
        // future: case pass(index: Int)
    }

    // MARK: – Published navigation state
    @Published var overlay: Overlay? = nil                // nil → no overlay
    @Published var navPath: [Transaction] = []            // for row pushes

    // MARK: – API helpers
    func showCardDetail(index: Int)             { overlay = .card(index: index) }
    func dismissOverlay()                       { overlay = nil }

    // For deep link / push notification examples:
    func open(cardIndex: Int, transaction: Transaction) {
        overlay = .card(index: cardIndex)
        navPath = [transaction]
    }
}
