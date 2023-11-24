/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

public enum AccountProvider: Hashable{

    case retailer(RetailerEnum)
    case email(EmailEnum)
    
    func name() -> String{
        switch(self){
            case .email(let emailEnum) :
                return emailEnum.rawValue.capitalized
            case .retailer(let retailerEnum):
                return retailerEnum.rawValue.capitalized
        }
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
