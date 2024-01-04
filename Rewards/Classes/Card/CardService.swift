/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation

public class CardService{
    private let repository = CardRepository()
    
    public func card(card: CreditCard){
        repository.add(card)
    }
    
    public func cards(cards: [CreditCard]){
        for card in cards {
            repository.add(card)
        }
    }
    
    public func cards() -> [CreditCard]{
        return repository.all()
    }
    
    public func remove(_ card: CreditCard){
        repository.remove(card)
    }
}
