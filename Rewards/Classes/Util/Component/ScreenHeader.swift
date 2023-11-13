/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct ScreenHeader: View{
    
  let title: String

  public var body: some View {
    HStack{
      Image(systemName: "arrow.backward")
      Text(title).font(SpaceGrotesk.bold(size: 20))
      Spacer()
    }.padding(.bottom, 28).padding(.horizontal, 15)
  }
}
