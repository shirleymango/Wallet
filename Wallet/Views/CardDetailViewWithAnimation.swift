//
//  CardDetailViewWithAnimation.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//
import SwiftUI
import Foundation

struct CardDetailViewWithAnimation: View {
    let cardIndex: Int
    @Binding var selectedCardIndex: Int?
    var animation: Namespace.ID

    var body: some View {
            VStack {
                HStack {
                    Button("Done") {
                        selectedCardIndex = nil
                    }
                    .padding()
                    Spacer()
                }

                CardView(cardHeight: 220, card: SampleCardData.cards[selectedCardIndex ?? 0])
                    .matchedGeometryEffect(id: cardIndex, in: animation, isSource: true)
                    .padding()

                Text("Latest Transactions")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25, weight: .bold))
                    .padding()
                
                List(SampleTransactionData.transactions) { txn in
                    NavigationLink {
                        TransactionDetailView(transaction: txn)
                    } label: {
                        TransactionView(transaction: txn)
                    }
                }

                Spacer()
            }
            .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
    }
}
