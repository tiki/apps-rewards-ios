/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */
import SwiftUI

public struct CircularProgressView: View {
    let progress: Double
    let progress2: Double?
    let progress3: Double?
    
    public var body: some View {
        ZStack {
            Circle().stroke(Color.tikiDarkGray, lineWidth: 25)
            Circle()
                .stroke(
                    Color.white,
                    lineWidth: 23
                )
            if(progress3 != nil){
                Circle()
                    .trim(from: 0.03, to: progress3!)
                    .stroke(
                        Color.tikiGreen.opacity(0.40),
                        style: StrokeStyle(
                            lineWidth: 24,
                            lineCap: .round
                        )
                    ).opacity(40)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress3)
            }
            if(progress2 != nil){
                Circle()
                    .trim(from: 0.03, to: progress2!)
                    .stroke(
                        Color.tikiGreen.opacity(0.60),
                        style: StrokeStyle(
                            lineWidth: 24,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress2)
            }
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
