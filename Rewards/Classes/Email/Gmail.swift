/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct Gmail: View{
    @State public var username: String = ""
    @State public var password: String = ""
    @State public var showAlert: Bool = false
    public var accountsList: [Account] = {
        var acc = [Account]()
        for account in AccountEnum.allCases {
            acc.append(Account.init(accountCommon: .init(name: account, type: .RETAILER), status:  .sync, username: "Username \(account.toString())"))
        }
        return acc
    }()
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
    
    
    public var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center){
                Spacer()
                HStack(){
                    Image(systemName: "arrow.backward")
                    Text("GMAIL").font(SpaceGrotesk.bold(size: 20)).foregroundColor(.tikiBlack)
                    Spacer()
                    Image(systemName: "xmark.circle").resizable().frame(width: 32, height: 32).foregroundColor(.tikiDarkGray)
                }.padding(.vertical, 28).padding(.horizontal, 15)
                VStack(){
                    ZStack(){
                        Rectangle().frame(width: 100, height: 100).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white).shadow(color: .tikiLightGray, radius: 0, x: 4, y: 4)
                        Image(uiImage: icon(icon: "Gmail")).resizable().frame(width: 100, height: 75.86)
                    }.frame(width: 100, height: 100).background(.white).padding(.top, 24)
                    HStack() {
                        Spacer()
                        Text("Gmail").font(SpaceGrotesk.bold(size: 32))
                        Spacer()
                    }.padding(.vertical, 16)
                    HStack() {
                        Text("When you connect your Gmail account, we auto-identify receipts and process available cashback rewards").font(SpaceGrotesk.medium(size: 14)).foregroundColor(.tikiDarkGray)
                    }.padding(.horizontal, 24).padding(.bottom, 24).multilineTextAlignment(.center)

                }.overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.tikiDarkGray)).padding(.horizontal, 21)
                HStack(){
                    Text("Accounts").font(SpaceGrotesk.bold(size: 28))
                    Spacer()
                }.padding(.leading, 21).padding(.top, 24)
                VStack(alignment: .leading){
                    ForEach(accountsList, id: \.accountCommon.name){ acc in
                        HStack(){
                            SheetHomeCarouselIcon(provider: acc, width: 56, height: 56)
                            VStack(alignment: .leading){
                                Text(acc.accountCommon.name.toString()).font(SpaceGrotesk.bold(size: 24)).foregroundStyle(Color.tikiDarkGray)
                                Text(acc.username ?? "username").font(SpaceGrotesk.medium(size: 20)).foregroundStyle(Color.tikiDarkGray)
                            }
                            Spacer()
                            Button(action: {print("TODO")}){
                                Image(uiImage: icon(icon: "minus")).resizable().frame(width: 36, height: 36).padding(.trailing, 29)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 21).padding(.bottom, 24)
                    }
                }
                HStack(){
                    Text("Add Account").font(SpaceGrotesk.bold(size: 28)).padding(.leading, 21)
                    Spacer()
                }
                Image(uiImage: icon(icon: "iosGoogle")).resizable().frame(width: 268, height: 58, alignment: .leading).padding(.bottom, 32).padding(.top, 20)
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
                VStack(alignment: .leading){
                    Text("Email").font(SpaceGrotesk.bold(size: 16)).foregroundColor(.tikiDarkGray)
                    TextField("", text: $username)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                        .foregroundColor(.black)
                        .frame(width: 348, height: 50)
                        .font(SpaceGrotesk.bold(size: 16))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke())
                }.padding(.horizontal, 21 )
                VStack(alignment: .leading){
                    Text("Password").font(SpaceGrotesk.bold(size: 16)).foregroundColor(.tikiDarkGray)
                    SecureField("", text: $password).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6)).foregroundColor(.black).frame(width: 348, height: 50)
                        .font(SpaceGrotesk.bold(size: 16))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke())
                }.padding(.horizontal, 21 )
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .font(SpaceGrotesk.medium(size: 20))
                        .lineLimit(1)
                        .frame(width: 360, height: 54)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray.opacity(0.5), lineWidth: 1)
                        )
                }.background(Color.tikiGreen)
                    .cornerRadius(8)
                    .padding(.horizontal, 15)
                    .padding(.top, 48)
                    .padding(.bottom, 40)
                    .alert("Error", isPresented: $showAlert) {
                    } message: {
                        Button("No one account match with this credentials", role: .cancel) { }
                    }

            }
        }.background(.white)
    }
}
private func icon(icon: String) -> UIImage{
    let bundle = Bundle(for: Rewards.self)
        print("bundle: \(bundle)")
        return UIImage(named: icon, in: bundle, compatibleWith: nil)!
}