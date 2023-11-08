/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import Foundation

public class Account {
    public var accountCommon: AccountCommon
    public var status: AccountStatus
    
    public init(accountCommon: AccountCommon, status: AccountStatus) {
        self.accountCommon = accountCommon
        self.status = status
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
        }
    }
}
