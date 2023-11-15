//
//  EmailLoginOAuth.swift
//  Rewards
//
//  Created by Ricardo on 15/11/23.
//

import SwiftUI

struct EmailLoginOAuth: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            TikiImages.google
                .resizable()
                .frame(height: 70)
                .onTapGesture {
                    print("google oauth login")
                }.padding(.top, 22)
            HStack(){
                VStack{
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.tikiDarkGray)
                }
                Text("or").font(SpaceGrotesk.regular(size: 14))
                    .padding(.horizontal, 14)
                VStack{
                    Divider().frame(height: 1)
                        .overlay(Color.tikiDarkGray)
                }
            }.padding(.top, 32)
        }
    }
}
