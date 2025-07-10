//
//  Transaction.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/9/25.
//

import Foundation

struct Transaction: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let storeName: String
    let amount: Double
    let timeStamp: Date
}
