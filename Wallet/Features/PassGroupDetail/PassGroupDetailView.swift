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
        let passGroupList: [Pass] = SamplePassGroupData.passGroups[passGroupIndex].passList
        
        VStack(spacing: 0) {
            // Header
            HStack {
                Button("Done", action: onDismiss)
                    .font(.headline)
                Spacer()
            }
            .padding()
            
            // Pass Tab View
            TabView() {
                ForEach(Array(passGroupList.enumerated()), id: \.offset) { index, item in
                    PassView(passHeight: passHeight,
                             pass: passGroupList[index])
                        .padding(.horizontal)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}
