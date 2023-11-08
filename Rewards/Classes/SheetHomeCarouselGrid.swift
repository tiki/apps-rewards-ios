/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct SheetHomeCarouselGrid: View{
    public var accountsList: [Account] = {
        var acc = [Account]()
        for account in AccountEnum.allCases {
            acc.append(Account.init(accountCommon: .init(name: account, type: .RETAILER), status:  .notLinked))
        }
        return acc
    }()
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    public var body: some View {
        VStack() {
            ScrollView {
                Text ("Increase Earnings").font(SpaceGrotesk.medium(size: 16)).padding(.bottom, 24).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 24)
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(accountsList, id: \.accountCommon.name){ acc in
                        SheetHomeCarouselIcon(provider: acc)
                    }
                }
            }
        }.background(.white)
    }
}
