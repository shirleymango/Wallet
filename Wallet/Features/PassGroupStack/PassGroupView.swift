//
//  PassGroupView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import Foundation
import SwiftUI
// TODO: MODIFY FOR GROUPS WITH MULTIPLE PASSES (currently only showing first pass in a group)

struct PassGroupView: View {
    let passGroupHeight: CGFloat
    let passGroup: PassGroup

    var body: some View {
        PassView(passHeight: passGroupHeight, pass: passGroup.passList[0])
    }
}
