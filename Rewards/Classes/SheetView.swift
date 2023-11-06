/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct SheetView: View {
    
    public init(){
        Font.registerSpaceGrotesk()
    }
    
    @State var showSheet: Bool? = false
    let cornorRadius: CGFloat = 8
    var background: Color = .green
    public var body: some View {
        Button(action: { showSheet = true }) {
            
            HStack (spacing: 5) {
               
                Image(systemName: "hand.tap.fill")
                    .font(.system(size: 20, weight: .regular, design: .rounded))

                Text("Click to open Tiki BottomSheet")
                    .font(.system(size: 20, weight: .regular, design: .rounded)).clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
        }
        .halfSheet(showSheet: $showSheet) {
            ZStack {
                
                Color.white
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    VStack(alignment: .center) {
                        VStack(alignment: .leading){
                            HStack(){
                                Text("CASHBACK CONNECTIONS")
                                    .font(SpaceGrotesk.bold(size: 22))
                                    .foregroundColor(ColorExtension.BlackTiki()).frame(maxWidth: .infinity, alignment: .leading)
                                Button(action: { showSheet?.toggle() }) {
                                    Image(systemName: "xmark.circle").font(.system(size: 30, weight: .light, design: .rounded))
                                        .foregroundColor(.black)
                                }
                            }.frame(minWidth: 342, maxWidth: 450, minHeight: 28, maxHeight: 28)
                            HStack() {
                                Text("Share data. Earn cash.")
                                    .font(SpaceGrotesk.medium(size: 16))                            .foregroundColor(ColorExtension.DarkGrayTiki())
                            }
                        }.padding (.top, 24)
                            .padding(.bottom, 32)
                            .padding(.horizontal, 24)

                        VStack() {
                            VStack(alignment: .center) {
                                Text("Earn monthly").font(SpaceGrotesk.medium(size: 20))
                                    .foregroundColor(ColorExtension.BlackTiki())
                                Text("$5 - $15").font(SpaceGrotesk.bold(size: 42))
                                    .foregroundColor(ColorExtension.GreenTiki())
                                Text("for your shopping habits").font(SpaceGrotesk.medium(size: 20))
                                    .foregroundColor(ColorExtension.BlackTiki())
                            }.frame(minWidth: 360, maxWidth: 450, minHeight: 200,alignment: .center).background(){
                                ZStack(alignment: .top) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black)
                                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 200, maxHeight: 250)
                                }.padding(.horizontal, 15)

                            }
                            HStack(){
                                Text("Estimate based on similar users spending habits and market price for shopping data.").font(SpaceGrotesk.medium(size: 14)).foregroundColor(ColorExtension.DarkGrayTiki())
                            }.padding(.horizontal, 15).padding(.top, 40)
                        }.padding(.leading, 15)
                            .padding(.top, 7)
                            .padding(.trailing, 15)
                        HStack(){
                            Button {
                                showSheet = false
                            } label: {
                                HStack {
                                    Text("Get estimate")
                                        .foregroundColor(.white)
                                        .font(SpaceGrotesk.medium(size: 20))
                                        .lineLimit(1)
                                }
                                .frame(minWidth: 360, maxWidth: .infinity, minHeight: 54, maxHeight: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: cornorRadius)
                                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                                )
                            }
                            .background(background)
                            .cornerRadius(cornorRadius)
                        }.padding(.horizontal, 15)
                            .padding(.vertical, 32)


                    
                    }

                }
            }
            .edgesIgnoringSafeArea(.bottom)
        } onDismiss: {
            print("sheet dismissed")
        }
    }
}

