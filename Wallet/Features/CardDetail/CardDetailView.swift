//
//  CardDetailViewWithAnimation.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//
import SwiftUI

/// The first-level “card detail” screen.
/// – Sits inside the global NavigationStack (path binding comes from router)
/// – Hosts its own list of transactions that can push deeper
struct CardDetailView: View {

    // MARK: – Inputs
    let cardIndex: Int
    @Binding var path: [Transaction]          // navigation path for rows
    let namespace: Namespace.ID
    let onDismiss: () -> Void

    // MARK: – Constants
    private let cardHeight: CGFloat = 220

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // ————————————————— Header bar
                HStack {
                    Button("Done", action: onDismiss)
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal)

                // ————————————————— Animated card
                CardView(cardHeight: cardHeight,
                         card: SampleCardData.cards[cardIndex])
                    .matchedGeometryEffect(id: cardIndex,
                                           in: namespace,
                                           isSource: false)
                    .padding(.horizontal)

                // ————————————————— Section title
                Text("Latest Transactions")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.horizontal)

                // ————————————————— List of transactions
                LazyVStack(spacing: 0) {
                    ForEach(SampleTransactionData.transactions) { txn in
                        NavigationLink(value: txn) {
                            TransactionView(transaction: txn)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.plain)
                        Divider()
                    }
                }
            }
            .padding(.top, 8)     // small gap below notch
        }
        .navigationDestination(for: Transaction.self) { txn in
            TransactionDetailView(transaction: txn)
        }
        .navigationBarHidden(true)            // hides default bar; we supply our own
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}
