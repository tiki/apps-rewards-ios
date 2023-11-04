//
//  ContentView.swift
//  RewardsExampleApp
//
//  Created by Jesse Monteiro Ferreira on 27/10/23.
//

import SwiftUI
import Foundation

public struct SheetView: View {
    
    public init(){
        Font.registerSpaceGrotesk()
    }
    
    @State var showSheet: Bool? = false
    
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("CASHBACK CONNECTIONS")
                                .font(SpaceGrotesk.regular(size: 22))
                            Image(systemName: "xmark.circle").font(.system(size: 25, weight: .light, design: .rounded))
                                .foregroundColor(.gray)
                        }.padding(.leading, 24)
                            .padding(.top, 24)
                            .padding(.trailing, 24)
                        Text("Share data. Earn cash.")
                            .font(.system(size: 18, weight: .light, design: .rounded))
                            .foregroundColor(.gray)
                            .padding(.leading, 24)
                            .padding(.bottom, 10)
                            .padding(.top, 0)
                        
                        Button(action: { showSheet = false }) {
                            
                            HStack(spacing: 5) {
                                
                                Image(systemName: "hand.tap.fill")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Text("me to close sheet")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
//                    .padding(.top, 10)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        } onDismiss: {
            print("sheet dismissed")
        }
    }
}

