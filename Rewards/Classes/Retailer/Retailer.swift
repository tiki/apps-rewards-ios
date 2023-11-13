/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct Retailer: View{
    @State public var logged: Bool = true
    @State public var username: String = ""
    @State public var password: String = ""
    @State public var showAlert: Bool = false
    public var cashbackPercentage: Int = 3
    public var account = Account(accountCommon: .init(name: .Walmart, type: .RETAILER), status: .verfied, username: "Username Walmart")
        
    
    public var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center){
                ScreenHeader("GMAIL")
                VStack(){
                    ZStack(){
                        Image(uiImage: icon(icon: account.accountCommon.name.toString())).resizable().frame(width: 100, height: 100).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white).shadow(color: .tikiLightGray, radius: 0, x: 4, y: 4)
                    }.frame(width: 100, height: 100).background(.white).padding(.top, 24)
                    
                    HStack() {
                        Spacer()
                        Text(account.accountCommon.name.toString()).font(SpaceGrotesk.bold(size: 32))
                        Spacer()
                    }.padding(.vertical, 16)
                    HStack() {
                        Text("\(cashbackPercentage)% cashback on all purchases").font(SpaceGrotesk.medium(size: 14)).foregroundColor(.tikiDarkGray)
                    }.padding(.horizontal, 24).padding(.bottom, 24).multilineTextAlignment(.center)

                }.overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.tikiDarkGray)).padding(.horizontal, 21)
                HStack(){
                    Text("Accounts").font(SpaceGrotesk.bold(size: 28))
                    Spacer()
                }.padding(.leading, 21).padding(.top, 24)
                VStack(alignment: .leading){
                    if(logged){
                        HStack(){
                            SheetHomeCarouselIcon(provider: account, width: 56, height: 56)
                            VStack(alignment: .leading){
                                Text(account.accountCommon.name.toString()).font(SpaceGrotesk.bold(size: 24)).foregroundStyle(Color.tikiDarkGray)
                                Text(account.username ?? "username").font(SpaceGrotesk.medium(size: 20)).foregroundStyle(Color.tikiDarkGray)
                            }
                            Spacer()
                            Button(action: {print("TODO")}){
                                Image(uiImage: icon(icon: "minus")).resizable().frame(width: 36, height: 36).padding(.trailing, 29)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 21).padding(.bottom, 24)
                    }
                }
                if(!logged) {
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
                        
                    }.padding(.top, 12).padding(.horizontal, -50)
                    VStack(alignment: .leading){
                        Text("Password").font(SpaceGrotesk.bold(size: 16)).foregroundColor(.tikiDarkGray)
                        SecureField("", text: $password).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6)).foregroundColor(.black).frame(width: 348, height: 50)
                            .font(SpaceGrotesk.bold(size: 16))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke())
                    }
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
                        .padding(.top, 32)
                        .alert("Error", isPresented: $showAlert) {
                        } message: {
                            Button("No one account match with this credentials", role: .cancel) { }
                        }
                }
  
                Button {
                    logged.toggle()
                    print("TODO Scan Receipt")
                } label: {
                    Text("Scan Receipt")
                        .foregroundColor(.tikiGreen)
                        .font(SpaceGrotesk.medium(size: 20))
                        .lineLimit(1)
                        .frame(width: 360, height: 54)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.tikiGreen, lineWidth: 2)
                        )
                }.background(.white)
                    .cornerRadius(8)
                    .padding(.horizontal, 15)
                    .padding(.top, 22)
                    .padding(.bottom, 24)
                    .alert("Error", isPresented: $showAlert) {
                    } message: {
                        Button("Scan Receipt Unavailable", role: .cancel) { }
                    }
                
                HStack(){
                    Text("More Offers").font(SpaceGrotesk.bold(size: 28))
                    Spacer()
                }.padding(.leading, 21).padding(.bottom, 24)
                HStack(){
                    SheetHomeCarouselIcon(provider: account, width: 56, height: 56)
                    VStack(alignment: .leading){
                        Text("4% cashback on electronics").font(SpaceGrotesk.medium(size: 15)).foregroundStyle(Color.tikiDarkGray)
                    }
                    Spacer()
                    Button(action: {print("TODO")}){
                        Image(uiImage: icon(icon: "arrowRight")).resizable().frame(width: 36, height: 36).padding(.trailing, 29)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 21).padding(.bottom, 24)                
                HStack(){
                    SheetHomeCarouselIcon(provider: account, width: 56, height: 56)
                    VStack(alignment: .leading){
                        Text("4% cashback on electronics").font(SpaceGrotesk.medium(size: 15)).foregroundStyle(Color.tikiDarkGray)
                    }
                    Spacer()
                    Button(action: {print("TODO")}){
                        Image(uiImage: icon(icon: "arrowRight")).resizable().frame(width: 36, height: 36).padding(.trailing, 29)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 21).padding(.bottom, 24)
            }

        }.background(.white)
    }
}
private func icon(icon: String) -> UIImage{
    let bundle = Bundle(for: Rewards.self)
        print("bundle: \(bundle)")
        return UIImage(named: icon, in: bundle, compatibleWith: nil)!
}
