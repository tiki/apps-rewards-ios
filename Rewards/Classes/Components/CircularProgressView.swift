/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */
import SwiftUI

public struct CircularProgressView: View {
    let progress: Double
    
    public var body: some View {
        ZStack {
            Circle().stroke(Color.tikiDarkGray, lineWidth: 25)
            Circle()
                .stroke(
                    Color.white,
                    lineWidth: 23
                )
            Circle()
                .trim(from: 0.03, to: progress)
                .stroke(
                    Color.tikiGreen,
                    style: StrokeStyle(
                        lineWidth: 24,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}
