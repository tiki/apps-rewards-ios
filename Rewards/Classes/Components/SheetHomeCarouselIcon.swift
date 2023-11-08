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
                Image(uiImage: provider.accountCommon.icon).resizable().frame(width: 80, height: 80).clipShape(RoundedRectangle(cornerRadius: 10))

                
                Button(action: { print("algo") }) {
                    Image(uiImage: Account.iconStatus(status: provider.status)!).resizable().frame(width: 32, height: 32)
                }
            }.frame(maxWidth: 80, maxHeight: 80).padding(.bottom, 10)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Text("Add").font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray)
                Text(provider.accountCommon.name.toString()).font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray)
            }

        }.frame(minWidth: 88, maxWidth: .infinity, minHeight: 120, maxHeight: .infinity)
    }
}

public func images() -> Image{
    let bundle = Bundle(for: Rewards.self)
    let resourceBundle = Bundle(url: bundle.url(forResource: "RewardsIcons", withExtension: "bundle")!)!
    return Image("walmart", bundle: bundle)
}
