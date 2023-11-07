/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */
import SwiftUI
import Rewards

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle().stroke(Color.black, lineWidth: 20)
            Circle()
                .stroke(
                    Color.white,
                    lineWidth: 19
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.tikiGreen(),
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)

        }
    }
}
