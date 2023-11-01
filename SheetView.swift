//
//  ContentView.swift
//  Rewards
//
//  Created by Jesse Monteiro Ferreira on 27/10/23.
//

import SwiftUI

public struct RewardsContent: View {
    @State var dragOffsetY: CGFloat = 0
    @State var isShowingBiding: Bool = true

    public var body: some View {
        ZStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Tiki 1!")
        }.asBottomSheet(isShowing: $isShowingBiding, offset: $dragOffsetY, onDismiss: {print("Dismiss")})
        .padding()
    }
}
