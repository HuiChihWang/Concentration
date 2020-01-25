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
    
    var numberPairCards: Int = 0
    var gameScore: Int = 0
    
    
    
    var cards = [Card]()
    var visitSet = Set<Int>()
    
    func shuffleCards(){
        cards.shuffle()
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func Reset(){
        gameScore = 0
        cards.removeAll()
        visitSet.removeAll()
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
                gameScore += 2
            }
            
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
            
            
            if visitSet.contains(cards[index].identifier), !cards[index].isMatched{
                gameScore -= 1;
                gameScore = max(0, gameScore)
            }
            
            cards[index].isVisit = true
            cards[matchIndex].isVisit = true
        }
        
        else {
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFaceUp = false
            }
            
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
            
        }
        
        visitSet.insert(cards[index].identifier)
    }
    
}
