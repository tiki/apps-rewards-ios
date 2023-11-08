/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */
import SwiftUI

public struct CircularProgressView: View {
    let progress: Double
    
    public var body: some View {
        ZStack {
            Circle().stroke(Color.black, lineWidth: 20)
            Circle()
                .stroke(
                    Color.white,
                    lineWidth: 19
                )
            Circle()
                .trim(from: 0.02, to: progress)
                .stroke(
                    Color.tikiGreen,
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}
