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
    public static func iconStatus(status: AccountStatus) -> UIImage? {
        switch status {
        case .notLinked:
            let bundle = Bundle(for: Rewards.self)
            print("bundle: \(bundle)")
            return UIImage(named: "ic_add", in: bundle, compatibleWith: nil)!
        case .verfied:
            return nil
        case .unverify:
            let bundle = Bundle(for: Rewards.self)
            print("bundle: \(bundle)")
            return UIImage(named: "ic_alert", in: bundle, compatibleWith: nil)!
        case .sync:
            let bundle = Bundle(for: Rewards.self)
            print("bundle: \(bundle)")
            return UIImage(named: "sync", in: bundle, compatibleWith: nil)!
        }
    }
}
