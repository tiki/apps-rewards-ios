/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import Foundation
import SwiftUI

public struct TikiImages{
    public static let google_signin = Image(uiImage: icon(icon: "google_signin"))
    public static let minus = Image(uiImage: icon(icon: "minus"))
    public static let arrow_right = Image(uiImage: icon(icon: "arrowRight"))
    
    public static func from(_ from: String) -> Image {
        return  Image(uiImage: icon(icon: from))
    }
}

private func icon(icon: String) -> UIImage{
    let bundle = Bundle(for: Rewards.self)
        print("bundle: \(bundle)")
        return UIImage(named: icon, in: bundle, compatibleWith: nil)!
}
