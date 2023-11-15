/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public struct MoreCard: View {
    
    let largestContributors: [MoreContributor] = Rewards.largestContributors()

    public var body: some View {
        HStack(spacing: 0){
            VStack(alignment: .leading, spacing: 0){
                Text("Largest Contributors").font(SpaceGrotesk.bold(size: 14))
                    .foregroundColor(Color.tikiGreen)
                    .padding(.bottom, 2)
                ForEach(largestContributors, id: \.name){ contributor in
                    Text("\(contributor.name): \(Int(contributor.percentage*100))%").font(SpaceGrotesk.medium(size: 14))
                        .foregroundColor(Color.tikiDarkGray)
                        .padding(.bottom, 2)
                }
            }
            .padding(.leading, 32)
            .padding(.vertical, 35)
            Spacer()
            CircularProgressView(progress: largestContributors[0].percentage, progress2: largestContributors[1].percentage, progress3: largestContributors[2].percentage).frame(width: 80, height: 80)
                .padding(.trailing, 41)
        }.asCard()
    }
}

