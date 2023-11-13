/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct SheetHomeCarouselIcon : View {
    public var provider: Account
    public var width: CGFloat?
    public var height: CGFloat?

    public init(provider: Account, width: CGFloat, height:CGFloat) {
        self.provider = provider
        self.width = width
        self.height = height
        
    }

    public var body: some View {
        VStack() {
            ZStack() {
                Image(uiImage: provider.accountCommon.icon)
                  .resizable()
                  .frame(width: width, height: height)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
                  .shadow(color: .tikiLightGray, radius: 0, x: 2, y: 2)
                Button(action: { print("TODO") }) {
                    if(Account.iconStatus(status: provider.status) != nil) {
                        Image(uiImage: Account.iconStatus(status: provider.status)! )
                          .resizable()
                          .frame(width: 32, height: 32)
                    }
                }
            }.frame(maxWidth: 80, maxHeight: 80)

        }
    }
}