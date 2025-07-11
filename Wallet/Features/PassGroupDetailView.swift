//
//  PassGroupDetailView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import SwiftUI

struct PassGroupDetailView: View {
    let passGroupIndex: Int
    let onDismiss: () -> Void
    
    private let passHeight: CGFloat = 500
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button("Done", action: onDismiss)
                    .font(.headline)
                Spacer()
            }
            .padding()
            
            // Pass
            PassView(passHeight: passHeight,
                     pass: SamplePassGroupData.passGroups[passGroupIndex].passList[0])
                .padding(.horizontal)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}
