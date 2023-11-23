/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

struct OfferTerms: View {
    
    @Binding var showTerms: Bool
    let onLicenseAccepted: () -> Void
    
    var body: some View {
        VStack(spacing: 0){
            ScreenHeader(title: "PROGRAM TERMS", action: {
                showTerms = false
            }).padding(.vertical, 30)
            ScrollView(.vertical){
                Text(Rewards.terms()).font(Rewards.theme.fontRegular(size: 16)).padding(.horizontal, 15)
            }
            Divider().frame(height: 1)
                .overlay(Rewards.theme.accentColor).padding(.horizontal, 15)
            if(!Rewards.isLicensed()) {
                Button {
                    onLicenseAccepted()
                } label: {
                    Text("I agree")
                        .foregroundColor(.white)
                        .font(SpaceGrotesk.medium(size: 20))
                        .lineLimit(1)
                        .frame(width: 360, height: 54)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        )
                }.background(Rewards.theme.accentColor)
                    .cornerRadius(8)
                    .padding(.horizontal, 15)
                    .padding(.top, 32)
            }
        }
        .padding(.bottom, Rewards.isLicensed() ? 40 : 0)
        .background(.white)
    }
}
