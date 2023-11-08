/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct SheetHomeCarousel : View {
    public var accountsList: [Account] = {
        var acc = [Account]()
        for account in AccountEnum.allCases {
            acc.append(Account.init(accountCommon: .init(name: account, type: .RETAILER), status:  .notLinked))
        }
        return acc
    }()
    public var body: some View {
        ScrollView (.horizontal){
            HStack(spacing: 20) {
                ForEach(accountsList, id: \.accountCommon.name){ acc in
                    SheetHomeCarouselIcon(provider: acc)

                }
            }
        }.frame(width: 390, height: 120)

    }
}
