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
        UIFont.registerSpaceGrotesk()
    }
    
    @State var showSheet: Bool? = false
    let cornorRadius: CGFloat = 8
    var background: Color = .green
    public var body: some View {
        
        Button(action: { showSheet?.toggle() }) {
            HStack (spacing: 5) {
                Text("Hello Google").font(.custom("SpaceGrotesk", size: 20))
                Image(systemName: "hand.tap.fill")
                    .font(.system(size: 20, weight: .regular, design: .rounded))

                Text("Click to open Tiki BottomSheet")
                    .font(.system(size: 20, weight: .regular, design: .rounded)).clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
        }.navigationTitle("Modal Sheet")
        .halfSheet(showSheet: $showSheet) {
            ZStack {
                
                Color.white
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    VStack(alignment: .center) {
                        VStack(alignment: .leading){
                            HStack(){
                                Text("CASHBACK CONNECTIONS")
                                    .font(.custom("SpaceGrotesk", size: 22))
                                    .foregroundColor(.black).bold()
                                Button(action: { showSheet?.toggle() }) {
                                    Image(systemName: "xmark.circle").font(.system(size: 25, weight: .semibold, design: .rounded))
                                        .foregroundColor(.black)
                                }
                            }
                            HStack() {
                                Text("Share data. Earn cash.")
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    .foregroundColor(.gray.opacity(0.90))
                            }
  
                        }.padding(.top, 24)
                            .padding(.bottom, 32)

                        VStack() {
                            VStack(alignment: .center) {
                                Text("Earn monthly").font(.system(size: 20, weight: .regular, design: .rounded))
                                    .foregroundColor(.black)
                                Text("$5 - $15").font(.system(size: 42, weight: .bold, design: .rounded))
                                    .foregroundColor(.green)
                                Text("for your shopping habits").font(.system(size: 20, weight: .regular, design: .rounded))
                                    .foregroundColor(.black)
                            }.padding().padding(.horizontal, 15).frame(width: 360,height: 201,alignment: .center).background(){
                                ZStack(alignment: .top) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black)
                                        .frame(width: 360, height: 211)
                                }

                            }
                            HStack(){
                                Text("Estimate based on similar users spending habits and market price for shopping data.").font(Font.custom("SpaceGrotesk-Bold", size: 14))
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
                                        .font(.system(size: 20, weight: .bold))
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

public struct ContentView: View {
    @State private var showingSheet = false

    public var body: some View {
        Button("Click to open Tiki BottomSheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}

