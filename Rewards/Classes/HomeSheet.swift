/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct HomeSheet: View {
    
    let onDismiss: () -> Void
    @State var showSheet: Bool = true
    @State var offset: CGFloat = 0
    
    public init(_ onDismiss: @escaping () -> Void){
        Font.registerSpaceGrotesk()
        self.onDismiss = onDismiss
    }

    public var body: some View {
        if(showSheet){
            VStack(alignment: .center) {
                Title(close: {
                    showSheet = false
                    onDismiss()
                })
                    .padding(.horizontal, 24)
                    .padding(.top, 16)
                Card()
                    .padding(.horizontal, 15)
                    .padding(.top, 48)
                Text("Estimate based on similar users spending habits and market price for shopping data.")
                    .font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(.tikiDarkGray)
                    .padding(.horizontal, 15)
                    .padding(.top, 36)
                Button {
                    showSheet = false
                    onDismiss()
                } label: {
                    Text("Get estimate")
                        .foregroundColor(.white)
                        .font(SpaceGrotesk.medium(size: 20))
                        .lineLimit(1)
                        .frame(width: 360, height: 54)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                .background(Color.tikiGreen)
                .cornerRadius(8)
                .padding(.horizontal, 15)
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
            .transition(.bottomSheet)
            .background(.white)
            .asBottomSheet(
                isShowing: $showSheet,
                offset: $offset,
                onDismiss: {
                    showSheet = false
                    onDismiss()
                }
            )
        }
    }
}
