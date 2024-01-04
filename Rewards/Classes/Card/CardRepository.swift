/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

class CardRepository{
    private var cards: Set = Set<CreditCard>()
    
    public func add(_ card: CreditCard){
        cards.insert(card)
    }
    public func remove(_ card: CreditCard){
        cards.remove(card)
    }

    public func all() -> [CreditCard]{
        return Array(cards)
    }
}
