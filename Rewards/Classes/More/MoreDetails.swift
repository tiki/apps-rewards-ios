//
//  MoreDetails.swift
//  Rewards
//
//  Created by Ricardo on 13/11/23.
//

import SwiftUI

struct MoreDetails: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Program Details").font(SpaceGrotesk.bold(size: 28))
            VStack(alignment: .center, spacing: 0){
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 36, height: 36, alignment: .center)
                    .foregroundColor(.tikiGreen)
                    .padding(.vertical, 24)
                MoreDetailsData()
                    .frame(width: 275)
                    .padding(.horizontal, 36.5)
                MoreDetailsUse()
                    .padding(.top, 48)
                MoreDetailsActions()
                    .padding(.top, 48)
            }
            .asCard()
            .padding(.top, 16)
        }
    }
}
