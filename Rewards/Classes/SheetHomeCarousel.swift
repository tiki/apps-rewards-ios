/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct SheetHomeCarousel : View {

    public init() {}
    
    public var body: some View {
        VStack() {
            ZStack() {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/tiki/capture-receipt-capacitor/main/src/account/images/walmart.png")).clipShape(RoundedRectangle(cornerRadius: 25))
                Button(action: { print("algo") }) {
                    Image(systemName: "plus.circle").background(Color.black.opacity(0.50).clipShape(Circle())).font(.system(size: 44,weight: .regular))
                        .foregroundColor(.white)
                }
            }
            Text("Add Walmart").font(.system(size: 12,weight: .regular))

        }.frame(minWidth: 88, maxWidth: .infinity, minHeight: 120, maxHeight: .infinity)
    }
}
