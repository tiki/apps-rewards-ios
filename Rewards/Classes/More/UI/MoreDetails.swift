/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct MoreDetails: View {
    @Binding var showTerms: Bool
    @Binding var showSheet: Bool
    @Binding var showMoreSheet: Bool
    let onDismiss: () -> Void
    let onLicenseAccepted: () -> Void
    let onLicenseDeclined: () -> Void

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Program Details").font(SpaceGrotesk.bold(size: 28))
            VStack(alignment: .center, spacing: 0){
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 36, height: 36, alignment: .center)
                    .foregroundColor(Rewards.theme.accentColor)
                    .padding(.vertical, 24)
                MoreDetailsData()
                    .frame(width: 275)
                    .padding(.horizontal, 36.5)
                MoreDetailsUse()
                    .padding(.top, 48)
                MoreDetailsActions(showTerms: $showTerms, showSheet: $showSheet, showMoreSheet: $showMoreSheet, onDismiss: onDismiss, onLicenseAccepted: onLicenseAccepted, onLicenseDeclined: onLicenseDeclined)
                    .padding(.top, 48)
            }
            .asCard()
            .padding(.top, 16)
        }
    }
}
