/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
 
import SwiftUI

public struct Card: ViewModifier {

    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
//            .padding(.vertical, 48)
            .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .shadow(color: .tikiLightGray, radius: 0, x: 4, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(Color.tikiDarkGray))
            )
    }
}

extension View {
    func asCard() -> some View {
        modifier(Card())
    }

}
