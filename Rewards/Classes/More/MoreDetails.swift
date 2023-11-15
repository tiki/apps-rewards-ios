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
        VStack(alignment: .center, spacing: 0){
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 36, height: 36, alignment: .center)
                .foregroundColor(.tikiGreen)
            MoreDetailsData()
            MoreDetailsUse()
            MoreDetailsActions()
        }
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.tikiDarkGray)).padding(.horizontal, 21)
    }
}
