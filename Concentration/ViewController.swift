//
//  ViewController.swift
//  Concentration
//
//  Created by IVSD on 2020/1/21.
//  Copyright © 2020年 IVSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfPairsCard: (cardButtons.count + 1) / 2)
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            UpdateViewFromModel()
        }
        else{
            print("Chosen card doesn't exist!")
        }
        
        
    }
    func UpdateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(GetEmoji(for: card), for:UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func flipCard(WithEmoji emoji :String, on button: UIButton) {
        if (button.currentTitle == emoji){
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        }
    }
    
    var emojiChoices = ["🇹🇼", "🇳🇿", "🇯🇵", "🇺🇸", "🇨🇦","🇰🇷"]
    var mapIndexEmoji = [Int:String]()
    
    func GetEmoji(for card: Card) -> String {
        
        if mapIndexEmoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomInt = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            mapIndexEmoji[card.identifier] = emojiChoices.remove(at: randomInt)
        }
        /*
        if mapIndexEmoji[card.identifier] != nil {
            return emojiChoices[card.identifier]!
        }
        else{
            return "?"
        }
        */
        

        return mapIndexEmoji[card.identifier] ?? "?"
    }
    

}

