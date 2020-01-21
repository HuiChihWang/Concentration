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
        for _ in 1...numberOfPairsCard {
            let card = Card()
            let matchingCard = card
            cards += [card, matchingCard]
        }
    }
    var cards = [Card]()
    
    func shuffleCards(){
        
    }
    
    func chooseCard(at index: Int){
        
    }
}
