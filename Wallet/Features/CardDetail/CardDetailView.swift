//
//  CardDetailView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//
import SwiftUI

struct CardDetailView: View {

    // MARK: – Inputs
    let cardIndex: Int
    @Binding var path: [Transaction]          // navigation path for pushes
    let namespace: Namespace.ID
    let onDismiss: () -> Void

    private let cardHeight: CGFloat = 220

    var body: some View {
        VStack(spacing: 0) {

            // ————————————————— Header with Done button
            HStack {
                Button("Done", action: onDismiss)
                    .font(.headline)
                Spacer()
            }
            .padding()

            // ————————————————— Animated card
            CardView(cardHeight: cardHeight,
                     card: SampleCardData.cards[cardIndex])
                .matchedGeometryEffect(id: cardIndex,
                                       in: namespace,
                                       isSource: false)
                .padding(.horizontal)

            // ————————————————— Section header
            Text("Latest Transactions")
                .font(.system(size: 25, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 8)

            // ————————————————— List with chevrons
            List(SampleTransactionData.transactions) { txn in
                NavigationLink(value: txn) {
                    TransactionView(transaction: txn)       // has its own colors
                }
            }
            .listStyle(.plain)               // flush edges; keeps chevrons
        }
        .navigationDestination(for: Transaction.self) { txn in
            TransactionDetailView(transaction: txn)
        }
        .navigationBarHidden(true)           // we manage navigation UI
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}
