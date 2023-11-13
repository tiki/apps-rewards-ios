/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerLogin: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Email").font(SpaceGrotesk.bold(size: 16)).foregroundColor(.tikiDarkGray)
            TextField("", text: $username)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                .foregroundColor(.black)
                .frame(minWidth: 348, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
                .font(SpaceGrotesk.bold(size: 16))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke())
            
        }.padding(.horizontal, 24)
        VStack(alignment: .leading){
            Text("Password").font(SpaceGrotesk.bold(size: 16)).foregroundColor(.tikiDarkGray)
            SecureField("", text: $password).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6)).foregroundColor(.black)
                .frame(minWidth: 348, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
                .font(SpaceGrotesk.bold(size: 16))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke())
        }.padding(.horizontal, 24)
        Button {
        showAlert.toggle()
        } label: {
            Text("Sign in")
                .foregroundColor(.white)
                .font(SpaceGrotesk.medium(size: 20))
                .lineLimit(1)
                .frame(minWidth: 360, maxWidth: .infinity, minHeight: 54, maxHeight: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
        }.background(Color.tikiGreen)
            .cornerRadius(8)
            .padding(.horizontal, 21)
            .padding(.top, 32)
            .alert("Error", isPresented: $showAlert) {
            } message: {
                Button("No one account match with this credentials", role: .cancel) { }
            }
    }
}
