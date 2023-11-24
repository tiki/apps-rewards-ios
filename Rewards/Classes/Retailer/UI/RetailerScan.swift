/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerScan: View {
    @Binding var logged: Bool 
    var body: some View {
        Button {
            logged.toggle()
        } label: {
            Text("Scan Receipt")
                .foregroundColor(Rewards.theme.accentColor)
                .font(Rewards.theme.fontMedium(size: 20))
                .padding(.vertical, 14)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Rewards.theme.accentColor, lineWidth: 4)
                )
        }.background(.white)
            .cornerRadius(8)
    }
}
