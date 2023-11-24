/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct HomeAccountGrid: View{
    
    @Binding var isOpen: Bool
    var accountsList: [AccountEnum]
    let onAccountSelect: (AccountEnum) ->  Void

    var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    public var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                LazyVGrid(columns: gridItemLayout, spacing: 24) {
                    ForEach(accountsList, id: \.rawValue){ acc in
                        AccountItem(accountEnum: acc, accountStatus: .notLinked)
                            .onTapGesture {
                                onAccountSelect(acc)
                        }
                    }
                }
            }.padding(.horizontal, 24)
            .frame(maxHeight: .infinity)

        }.refreshable {
            isOpen = false
        }
    }
}
