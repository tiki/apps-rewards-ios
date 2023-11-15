/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct HomeAccountGrid: View{
    
    @Binding var accountsList: [Account]

    var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    public var body: some View {
        VStack() {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(accountsList, id: \.accountCommon.name){ acc in
                   AccountItem(account: acc)
                }
            }
        }.background(.white)
    }
}

