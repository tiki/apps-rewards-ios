/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import Foundation

public enum AccountEnum : String, CaseIterable{
    case Walmart
    case Walmart1
    case Walmart2
    case Walmart3
    case Walmart4
    case Walmart5
    case Walmart6
    case Walmart7
    case Walmart8
    case Walmart9
    case Walmart10
    case Walmart11
    case Walmart12
    case Walmart13
    case Walmart14
    case Walmart15
    case UberEats
    case TacoBell
    case DollarGeneral
    
    public func toString() -> String{
        switch self {
        case .Walmart:
            return "Walmart"
        case .UberEats:
            return "Uber Eats"
        case .TacoBell:
            return "Taco Bell"
        case .DollarGeneral:
            return "Dollar General"
        case .Walmart1:
            return "Walmart1"
        case .Walmart2:
            return "Walmart2"
        case .Walmart3:
            return "Walmart3"
        case .Walmart4:
            return "Walmart4"
        case .Walmart5:
            return "Walmart5"
        case .Walmart6:
            return "Walmart6"
        case .Walmart7:
            return "Walmart7"
        case .Walmart8:
            return "Walmart8"
        case .Walmart9:
            return "Walmart9"
        case .Walmart10:
            return "Walmart10"
        case .Walmart11:
            return "Walmart11"
        case .Walmart12:
            return "Walmart12"
        case .Walmart13:
            return "Walmart13"
        case .Walmart14:
            return "Walmart14"
        case .Walmart15:
            return "Walmart15"
        }
    }
}
