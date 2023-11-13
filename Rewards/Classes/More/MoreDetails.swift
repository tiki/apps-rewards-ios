//
//  MoreDetails.swift
//  Rewards
//
//  Created by Ricardo on 13/11/23.
//

import SwiftUI

struct MoreDetails: View {
    var body: some View {
        Text("Program Details").font(SpaceGrotesk.bold(size: 28)).padding(.horizontal, 21).padding(.top, 24)
        VStack(alignment: .center){
            HStack{
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 36, height: 36, alignment: .center)
                    .foregroundColor(.tikiGreen)
                Spacer()
            }
            VStack(alignment: .center) {
                Text("What data do we collect?").font(SpaceGrotesk.bold(size: 18)).foregroundColor(.tikiDarkGray)
                Text("Learn about how your data powers your cashback connections").font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray).multilineTextAlignment(.center)
            }.padding(.top, 24).padding(.horizontal, 36)
            VStack(alignment: .leading){
                HStack() {
                    HStack() {
                        Image(uiImage: icon(icon: "purchases")).resizable().frame(width: 18, height: 18)
                        Text("Purchases").font(SpaceGrotesk
                            .medium(size: 16)).foregroundColor(.tikiDarkGray)
                    }
                    Spacer()
                    HStack() {
                        Image(uiImage: icon(icon: "receipts")).resizable().frame(width: 18, height: 18)
                        Text("Receipts").font(SpaceGrotesk
                            .medium(size: 16)).foregroundColor(.tikiDarkGray)
                    }

                }.padding(.trailing, 10).padding(.horizontal, 49)
                HStack() {
                    Image(uiImage: icon(icon: "userId")).resizable().frame(width: 18, height: 18)
                    Text("User ID").font(SpaceGrotesk
                        .medium(size: 16)).foregroundColor(.tikiDarkGray)
                }.padding(.leading, 49)

            }.padding(.vertical, 24)
            Text("How is that data used?").font(SpaceGrotesk.bold(size: 18)).foregroundColor(.tikiDarkGray).padding(.vertical, 24)
            HStack() {
                Image(uiImage: icon(icon: "dollar")).resizable().frame(width: 18, height: 18)
                Text("Find cashback rewards").font(SpaceGrotesk
                    .medium(size: 16)).foregroundColor(.tikiDarkGray)
            }
            HStack() {
                Image(uiImage: icon(icon: "discount")).resizable().frame(width: 18, height: 18)
                Text("Relevant ads and offers").font(SpaceGrotesk
                    .medium(size: 16)).foregroundColor(.tikiDarkGray)
            }
            HStack() {
                Image(uiImage: icon(icon: "graphic")).resizable().frame(width: 18, height: 18)
                Text("Create shopper insights").font(SpaceGrotesk
                    .medium(size: 16)).foregroundColor(.tikiDarkGray)
            }.padding(.bottom, 24)
            Color.gray.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Report an issue").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiDarkGray)
                Spacer()
                Image(uiImage: icon(icon: "grayAlert")).resizable().frame(width: 18, height: 18)
                
            }.padding(.horizontal, 12).padding(.vertical, 5)
            Color.gray.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Data licensing agreement").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiDarkGray)
                Spacer()
                Image(uiImage: icon(icon: "handStop")).resizable().frame(width: 18, height: 18)
            }.padding(.horizontal, 12).padding(.vertical, 5)
            Color.gray.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Opt out of cashback connections").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.red)
                Spacer()
                Image(uiImage: icon(icon: "redStop")).resizable().frame(width: 18, height: 18)
            }.padding(.horizontal, 12).padding(.top, 5)
        }.padding(.top, 24).padding(.bottom, 16).overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.tikiDarkGray)).padding(.horizontal, 21)
    }
}
