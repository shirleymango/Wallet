//
//  TransactionDetailView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//
import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy, h:mm a"
        return formatter.string(from: transaction.timeStamp)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("$\(String(format: "%.2f", transaction.amount))")
                .font(.system(size: 75, weight: .bold, design: .rounded))

            Text("\(transaction.storeName)")
                .opacity(0.5)
            
            Text("\(formattedDate)")
                .opacity(0.5)

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

