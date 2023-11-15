//
//  EmailLoginImap.swift
//  Rewards
//
//  Created by Ricardo on 15/11/23.
//

import SwiftUI

struct EmailLoginImap: View {
    
    @State public var showAlert: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Email")
                .font(SpaceGrotesk.bold(size: 16))
                .foregroundColor(.tikiDarkGray)
            TextField("", text: $username)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .foregroundColor(.black)
                .frame(height: 50)
                .font(SpaceGrotesk.bold(size: 20))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke())
                .padding(.top, 8)
            Text("Password")
                .font(SpaceGrotesk.bold(size: 20))
                .foregroundColor(.tikiDarkGray)
                .padding(.top, 32)
            SecureField("", text: $password)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                .foregroundColor(.black)
                .frame(height: 50)
                .font(SpaceGrotesk.bold(size: 16))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke())
                .padding(.top, 8)
            Button {
                showAlert.toggle()
            } label: {
                Text("Sign in")
                    .foregroundColor(.white)
                    .font(SpaceGrotesk.medium(size: 20))
                    .lineLimit(1)
                    .frame(height: 54)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    )
            }
            .frame(maxWidth: .infinity)
            .background(Color.tikiGreen)
                .cornerRadius(8)
                .padding(.top, 48)
                .alert("Error", isPresented: $showAlert) {
                } message: {
                    Button("No account match with this credentials", role: .cancel) { }
                }
        }
    }
}
