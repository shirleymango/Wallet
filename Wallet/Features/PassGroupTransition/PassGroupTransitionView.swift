//
//  PassGroupTransitionView.swift
//  Wallet
//
//  Created by ZhuMacPro on 7/11/25.
//

import SwiftUI

struct PassGroupTransitionView: View {
    // Inputs
    let passGroupIndex: Int
    let namespace: Namespace.ID
    let onTransitionComplete: () -> Void

    // Animation state
    @State private var fanSpacing: CGFloat = 0       // start collapsed
    @State private var fadeOthers  = false

    private let startSpacing: CGFloat = 0            // matches list
    private let endSpacing:   CGFloat = 40           // big expanded fan
    private let passHeight:   CGFloat = 220

    var body: some View {
        let passGroup = SamplePassGroupData.passGroups[passGroupIndex]
        let offsets   = PassGroupTransitionLayout.layout(passCount: passGroup.passList.count,
                                               targetSpacing: fanSpacing)

        ZStack {
            // 1.  Overlay that fades other content
            Color(.systemBackground)
                .opacity(fadeOthers ? 1 : 0)
                .ignoresSafeArea()

            // 2.  Expanding fan of passes
            ZStack(alignment: .top) {
                ForEach(passGroup.passList.indices.reversed(), id: \.self) { i in
                    PassView(passHeight: passHeight, pass: passGroup.passList[i])
                        .matchedGeometryEffect(id: passGroup.passList[i].id,
                                               in: namespace,
                                               isSource: false)
                        .offset(y: offsets[i])
                        .padding(.horizontal)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .onAppear {
            // Step A – fade background + start spacing animation
            withAnimation(.easeOut(duration: 0.25)) { fadeOthers = true }
            withAnimation(.spring(response: 0.45, dampingFraction: 0.8)) {
                fanSpacing = endSpacing
            }

            // Step B – after animation ends, trigger final view
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                onTransitionComplete()
            }
        }
    }
}
