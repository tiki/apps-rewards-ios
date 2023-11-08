/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct SheetHomeCarouselCard: View {
    
    @State var showSheet: Bool = true
    @State var offset: CGFloat = 0
    
    public init(){
        let _ = Font.registerSpaceGrotesk()
    }
    
    public var body: some View {
        if(showSheet){
            VStack(alignment: .center) {
                Title(close: {
                    showSheet = false
                })
                .padding(.horizontal, 24)
                .padding(.top, 16)
                HomeCard()
                Text ("Increase Earnings").font(SpaceGrotesk.medium(size: 16)).padding(.bottom, 24).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 24)
                SheetHomeCarousel().padding(.bottom, 40)

            }.transition(.bottomSheet)
            .background(.white)
            .asBottomSheet(
                isShowing: $showSheet,
                offset: $offset,
                onDismiss: {
                    showSheet = false
                }
            )
        }
    }
}
