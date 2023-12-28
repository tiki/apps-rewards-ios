/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

public class Card {
    public var last4: String
    public var bin: String
    public var issuer: String
    public var network: CardNetwork
    
    public init(last4: String, bin: String, issuer: String, network: CardNetwork) {
        self.last4 = last4
        self.bin = bin
        self.issuer = issuer
        self.network = network
    }
    
    public static func equal(card1: Card, card2: Card) -> Bool {
        if(card1.bin == card2.bin && card1.issuer == card2.issuer && card1.last4 == card2.last4 && card1.network == card2.network){
            return true
        }else{
            return false
        }
    }
}
