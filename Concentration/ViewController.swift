//
//  ViewController.swift
//  Concentration
//
//  Created by IVSD on 2020/1/21.
//  Copyright © 2020年 IVSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🇹🇼", "🇳🇿", "🇯🇵", "🇺🇸"]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(WithEmoji: emojiChoices[cardNumber], on: sender)
        }
        else{
            print("Chosen card doesn't exist!")
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
    

}

