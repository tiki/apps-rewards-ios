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
            print("TODO Scan Receipt")
        } label: {
            Text("Scan Receipt")
                .foregroundColor(.tikiGreen)
                .font(SpaceGrotesk.medium(size: 20))
                .lineLimit(1)
                .frame(minWidth: 360, maxWidth: .infinity, minHeight: 54, maxHeight: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.tikiGreen, lineWidth: 2)
                )
        }.background(.white)
            .cornerRadius(8)
            .padding(.horizontal, 21)
            .padding(.top, 22)
            .padding(.bottom, 24)
    }
}
