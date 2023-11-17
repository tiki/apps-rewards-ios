/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
 
import SwiftUI

public struct Screen: ViewModifier {
    
    let title: String

    public func body(content: Content) -> some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 0){
                ScreenHeader(title: title, action: {})
                VStack(alignment: .leading, spacing: 0){
                    content
                }
                .padding(.horizontal, 21)
            }
            .padding(.bottom, 56)
        }.background(.white)
    }
}

extension View {
    func asScreen(title: String) -> some View {
        modifier(Screen(title: title))
    }

}