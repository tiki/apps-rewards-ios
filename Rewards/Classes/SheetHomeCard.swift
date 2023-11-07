/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI
import Rewards

public struct SheetHomeCard: View {
    @State var progress: Double = 0.25

    public init(){
        Font.registerSpaceGrotesk()
    }
    public var body: some View {
        ZStack() {
            HStack() {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading){
                        Text("Month").font(SpaceGrotesk.medium(size: 14))
                            .foregroundColor(Color.tikiBlack()).padding(.bottom, -3)
                        Text("$4.80 / $12.00").font(SpaceGrotesk.bold(size: 18))
                            .foregroundColor(Color.tikiGreen())
                    }.padding(.bottom, 12)
                    VStack(alignment: .leading) {
                        Text("Lifetime").font(SpaceGrotesk.medium(size: 14))
                            .foregroundColor(Color.tikiBlack()).padding(.bottom, -3)
                        Text("$34.30").font(SpaceGrotesk.bold(size: 18))
                            .foregroundColor(Color.tikiDarkGray())
                    }.padding(.bottom, 12)
                    Button {
                        progress += 1
                    } label: {
                        HStack {
                            Text("Show More")
                                .foregroundColor(Color.tikiDarkGray())
                                .font(SpaceGrotesk.bold(size: 18))
                                .lineLimit(1)
                        }
                    }
                
                    
                }.frame(maxWidth: .infinity)

                VStack {
                    VStack {
                        CircularProgressView(progress: progress)
                
                    }.frame(width: 100, height: 100)
                }.padding().frame(maxWidth: .infinity)
            }.frame(minWidth: 360, maxWidth: 450, minHeight: 200, alignment: .center).background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 10, x: 4, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(.black))
            )    }.padding(.horizontal, 24)

    }
    
}

