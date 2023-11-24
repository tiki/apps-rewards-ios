/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public struct Account: Hashable {

    public var username: String
    public var provider: AccountProvider
    public var status: AccountStatus = .unverified
    
    public func hash(into hasher: inout Hasher) {
      hasher.combine(username)
      hasher.combine(provider)
    }
    
    public static func == (lhs: Account, rhs: Account) -> Bool {
        lhs.username == rhs.username &&
        lhs.provider == rhs.provider
    }
}
