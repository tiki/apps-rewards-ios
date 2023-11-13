/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public class AccountCommon {
    public var icon: UIImage {
        let bundle = Bundle(for: Rewards.self)
        print("bundle: \(bundle)")
        return UIImage(named: name.rawValue, in: bundle, compatibleWith: nil)!
    }
    public var name: AccountEnum
    public var type: AccountType
    
    public init(name: AccountEnum, type: AccountType) {
        self.name = name
        self.type = type
    }
    
}
