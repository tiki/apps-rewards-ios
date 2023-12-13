/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import CaptureReceipt

public enum AccountProvider: Hashable{

    

    case retailer(RetailerEnum)
    case email(EmailEnum)
    
    func name() -> String{
        var name = ""
        switch(self){
            case .email(let emailEnum) :
                name = emailEnum.rawValue
            case .retailer(let retailerEnum):
                name = retailerEnum.rawValue
        }
        return name.replacingOccurrences(of: "_", with: " ").capitalized
    }
    
    static func all() -> [AccountProvider] {
        var providers: [AccountProvider] = []
        EmailEnum.allCases.forEach{ provider in
            providers.append(.email(provider))
        }
        RetailerEnum.allCases.forEach{ provider in
            providers.append(.retailer(provider))
        }
        return providers
    }
}
