/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct EmailView: View{
    @State public var showAlert: Bool = false
    @State public var accountsList: [Account] = []
    
    public var body: some View {
        ScrollView(.vertical) {
            ScreenHeader(title: accountsList[0].accountCommon.name.toString())
            EmailCard().asCard()
            Text("Accounts").font(SpaceGrotesk.bold(size: 28))
                .padding(.leading, 21).padding(.top, 24)
            VStack(alignment: .leading){
                ForEach(accountsList, id: \.accountCommon.name){ acc in
                    AccountView(acc: acc)
                }
            }
            HStack(){
                Text("Add Account").font(SpaceGrotesk.bold(size: 28)).padding(.leading, 21)
                Spacer()
            }
            TikiImages.google_signin
                .resizable()
                .frame(width: 268, height: 58, alignment: .leading)
                .padding(.bottom, 32).padding(.top, 20)
            HStack(){
                VStack(){
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.tikiDarkGray)
                }
                Text("or").font(SpaceGrotesk.bold(size: 14)).padding(.horizontal, 14)
                VStack(){
                    Divider().frame(height: 1)
                        .overlay(Color.tikiDarkGray)
                }
            }.padding(.horizontal, 21).padding(.bottom, 32)
            EmailLogin()
        }.background(.white)
    }
}


