//
//  WalletHomeView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/10/25.
//
import Foundation
import SwiftUI

struct WalletHomeView: View {
    @StateObject private var vm = WalletHomeViewModel()
    @StateObject private var router = WalletHomeRouter()
    @Namespace private var ns

    var body: some View {
        ZStack {
            ScrollView {
                ScrollTracker(action: vm.onScrollChange)
                    .frame(height: 0)
                
                Text("Wallet")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                
                // —— normal header / cards / passes ——
                CardStackView(selectedIndex: $vm.selectedCard,
                              cards: vm.cards,
                              scroll: vm.scrollOffset,
                              namespace: ns)
                
                PassesView()
                Spacer().frame(height: 60)
            }
            .coordinateSpace(name: "scroll")

            // Overlay card detail
            if let idx = vm.selectedCard {
                CardDetailRouter(cardIndex: idx,
                                 onDismiss: { vm.selectedCard = nil },
                                 namespace: ns)
            }
        }
        .animation(.spring(response: 0.4,
                           dampingFraction: 0.8),
                   value: vm.selectedCard)   // <- restores smooth morph
        .navigationBarHidden(vm.selectedCard != nil)
    }
}
