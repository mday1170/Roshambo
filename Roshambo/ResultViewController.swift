//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Michael Day on 5/6/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
    
    // 1 - Rock
    // 2 - Scissors
    // 3 - Paper
   
    
    @IBOutlet weak var gameMsgLabel: UILabel!
    @IBOutlet weak var imageResultView: UIImageView!
    
    
    var playerChoice: Int!
    var computerChoice: Int!
    
    override func viewWillAppear(animated: Bool) {
        // put code here
        
        
        gameMsgLabel.hidden = true
        imageResultView.hidden = true
        selectWinner(computeWinner)
        
        
    }
    
    func displayWinner(p: String, r: Int, m: String) {

        
        gameMsgLabel.hidden = false
        imageResultView.hidden = false
        
        switch(r) {
        case 0:
            gameMsgLabel.text = p + m
            imageResultView.image = UIImage(named: "ItsATie")
        case 1:
            gameMsgLabel.text = p + m
            imageResultView.image = UIImage(named: "RockCrushesScissors")
        case 2:
            gameMsgLabel.text = p + m
            imageResultView.image = UIImage(named: "ScissorsCutPaper")
        case 3:
            gameMsgLabel.text = p + m
            imageResultView.image = UIImage(named: "PaperCoversRock")
        default:
            gameMsgLabel.text = "No one played"
            imageResultView.image = UIImage(named: "ItsATie")
        }
    }
    
    func selectWinner(winner: () -> (Int, String)) {
        var playerWinner: Bool = false
        var noWinner: Bool = false
        var (result, msg): (Int, String) = winner()
        
        if result == 0 {
            noWinner = true
            displayWinner("Tie! ", r: result, m: msg)
        } else if (result == self.playerChoice ? true : false) {
            displayWinner("Player wins, ", r: result, m: msg)
        } else {
                displayWinner("Computer wins, ", r: result, m: msg)
            
        }
    }
    
    func computeWinner() -> (Int, String) {
        var choiceTuple = (self.playerChoice, self.computerChoice)
                switch (choiceTuple) {
                case (1,3), (3,1):
                    return (3, "Paper covers Rock.")
                case (1,1):
                    return (0, "Rock ties Rock.")
                case (1,2), (2,1):
                    return (1, "Rock smashes Scissors.")
                case (2,2):
                    return (0, "Scissors tie Scissors.")
                case (2,3), (3,2):
                    return (2, "Scissors win over Paper." )
                case (3,3):
                    return (0, "Paper ties Paper.")
                default:
                    return (0, "Not sure what happened")
                
            }
    }
    
            
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
            
            

    
    
}
