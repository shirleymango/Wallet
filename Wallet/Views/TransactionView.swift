//
//  TransactionView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import Foundation
import SwiftUI

struct TransactionView: View {
    let transaction: Transaction
    
    var timeString: String {
        let calendar = Calendar.current
        let now = Date()
        // Get difference in hours
        let hoursAgo = calendar.dateComponents([.hour], from: transaction.timeStamp, to: now).hour ?? 0
        
        if calendar.isDateInToday(transaction.timeStamp) {
            return "\(hoursAgo) Hours Ago"
        } else if calendar.isDate(transaction.timeStamp, equalTo: now, toGranularity: .weekOfYear) {
            let weekdayFormatter = DateFormatter()
            weekdayFormatter.dateFormat = "EEEE" // e.g., "Saturday"
            return weekdayFormatter.string(from: transaction.timeStamp)
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M/d/yy" // e.g., "6/19/25"
            return dateFormatter.string(from: transaction.timeStamp)
        }
    }
    
    var body: some View {
        
        HStack {
            Image(systemName: transaction.imageName) // Insert logo
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            VStack {
                HStack {
                    Text(transaction.storeName)
                        .bold()
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Spacer()
                    Text("$\(String(format: "%.2f", transaction.amount))")
                }
                HStack {
                    Text("Apple Pay")
                        .opacity(0.5)
                    Spacer()
                }
                HStack {
                    Text(timeString)
                        .opacity(0.5)
                    Spacer()
                }
            }
        }
    }
}
