/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public class Account {
    public var accountCommon: AccountCommon
    public var status: AccountStatus
    public var username: String?
    
    public init(accountCommon: AccountCommon, status: AccountStatus, username: String?) {
        self.accountCommon = accountCommon
        self.status = status
        self.username = username
    }
    public static func iconStatus(status: AccountStatus) -> Image? {
        switch status {
        case .notLinked:
            return TikiImages.icAdd
        case .verfied:
            return nil
        case .unverify:
            return TikiImages.icAlert
        case .sync:
            return TikiImages.sync
        }
    }
}
