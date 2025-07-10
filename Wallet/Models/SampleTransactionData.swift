//
//  SampleTransactionData.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import Foundation

struct SampleTransactionData {
    static let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "MM/dd/yy, h:mm a"
        f.locale = Locale(identifier: "en_US_POSIX")
        return f
    }()

    static let transactions: [Transaction] = [
        Transaction(
            imageName: "fork.knife",
            storeName: "Slowpokes West U",
            amount: 6.50,
            timeStamp: formatter.date(from: "07/09/25, 10:49 AM")!
        ),
        Transaction(
            imageName: "fork.knife",
            storeName: "OCL* Octopus Is9148662",
            amount: 20.26,
            timeStamp: formatter.date(from: "07/05/25, 12:21 AM")!
        ),
        Transaction(
            imageName: "fork.knife",
            storeName: "Dunkin'",
            amount: 5.31,
            timeStamp: formatter.date(from: "06/19/25, 6:28 PM")!
        )
    ]
}
