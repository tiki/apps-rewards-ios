/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct HomeAccountGrid: View{
    
    @Binding var accountsList

    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    public var body: some View {
        VStack() {
            ScrollView {
                Text ("Increase Earnings")
                  .font(SpaceGrotesk.medium(size: 16))
                  .padding(.bottom, 24)
                  .padding(.horizontal, 24)
                  .frame(maxWidth: .infinity, alignment: .leading)
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(accountsList, id: \.accountCommon.name){ acc in
                        VStack(
                          alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                            SheetHomeCarouselIcon(provider: acc, width: 77, height: 77)
                              .padding(.bottom, -15)
                        Text("Add")
                          .font(SpaceGrotesk.medium(size: 12))
                          .foregroundColor(.tikiDarkGray)
                        Text(acc.accountCommon.name.toString())
                          .font(SpaceGrotesk.medium(size: 12))
                          .foregroundColor(.tikiDarkGray)
                        }
                    }
                }
            }
        }.background(.white)
    }
}

