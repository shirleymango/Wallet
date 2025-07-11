//
//  PassGroup.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation
struct PassGroup: Identifiable {
    let id = UUID()
    let groupName: String
    let passList: [Pass]
}
