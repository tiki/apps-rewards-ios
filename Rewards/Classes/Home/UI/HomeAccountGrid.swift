/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct HomeAccountGrid: View{
    
    @Binding var isOpen: Bool
    @Binding var accountsList: [Account]

    var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    public var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                LazyVGrid(columns: gridItemLayout, spacing: 24) {
                    ForEach(accountsList, id: \.accountCommon.name){ acc in
                        AccountItem(account: acc)
                    }
                }
            }.frame(maxHeight: .infinity)
        }.refreshable {
            isOpen = false
        }
    }
}
