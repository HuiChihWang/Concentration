//
//  Concentration.swift
//  Concentration
//
//  Created by IVSD on 2020/1/21.
//  Copyright © 2020年 IVSD. All rights reserved.
//

import Foundation


class Concentration {
    init(numberOfPairsCard: Int) {
        numberPairCards = numberOfPairsCard
        Reset()
        shuffleCards()
    }
    
    var numberPairCards: Int
    
    var cards = [Card]()
    
    func shuffleCards(){
        cards.shuffle()
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func Reset(){
        cards.removeAll()
        for _ in 1...numberPairCards {
            let card = Card()
            let matchingCard = card
            cards += [card, matchingCard]
        }
    }
    
    func chooseCard(at index: Int){
        
        if cards[index].isMatched{
            return
        }
        
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
            if cards[index].identifier == cards[matchIndex].identifier{
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        }
        
        else {
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFaceUp = false
            }
            
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
            
        }
    }
    
}
