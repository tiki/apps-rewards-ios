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
            acc.append(Account.init(accountCommon: .init(name: account, type: .RETAILER), status:  .notLinked, username: "Username"))
        }
        return acc
    }()
    public var body: some View {
        ScrollView (.horizontal){
            HStack(spacing: 20) {
                ForEach(accountsList, id: \.accountCommon.name){ acc in
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        SheetHomeCarouselIcon(provider: acc, width: 77, height: 77)
                        Text("Add").font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray)
                        Text(acc.accountCommon.name.toString()).font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray)
                    }

                }
            }
        }.frame(width: 390, height: 120)

    }
}
