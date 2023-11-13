/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerScan: View {
    var body: some View {
        Button {
            print("TODO Scan Receipt")
        } label: {
            Text("Scan Receipt")
                .foregroundColor(.tikiGreen)
                .font(SpaceGrotesk.medium(size: 20))
                .lineLimit(1)
                .frame(width: 360, height: 54)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.tikiGreen, lineWidth: 2)
                )
        }.background(.white)
            .cornerRadius(8)
            .padding(.horizontal, 15)
            .padding(.top, 22)
            .padding(.bottom, 24)
    }
}
