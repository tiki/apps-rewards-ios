/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct SheetHomeCarouselIcon : View {
    public var provider: Account

    public init(provider: Account) {
        self.provider = provider
        
    }

    
    public var body: some View {
        VStack() {
            ZStack() {
                Image(uiImage: provider.accountCommon.icon).resizable().frame(width: 77, height: 77).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(color: .tikiLightGray, radius: 0, x: 4, y: 4)
                Button(action: { print("algo") }) {
                    if(Account.iconStatus(status: provider.status) != nil) {
                        Image(uiImage: Account.iconStatus(status: provider.status)! ).resizable().frame(width: 32, height: 32)
                    }
                }
            }.frame(maxWidth: 80, maxHeight: 80)

        }.frame(minWidth: 88, maxWidth: .infinity, minHeight: 120, maxHeight: .infinity)
    }
}

public func images() -> Image{
    let bundle = Bundle(for: Rewards.self)
    let resourceBundle = Bundle(url: bundle.url(forResource: "RewardsIcons", withExtension: "bundle")!)!
    return Image("walmart", bundle: bundle)
}
