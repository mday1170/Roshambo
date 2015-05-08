//
//  ViewController.swift
//  Roshambo
//
//  Created by Michael Day on 5/4/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func randomComputerChoice() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
        
    }
    
    // 1 - Rock
    // 2 - Scissors
    // 3 - Paper
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        controller.computerChoice = self.randomComputerChoice()
        if let chkSegue = segue.identifier {
            switch chkSegue {
                case "paperSegue":
                controller.playerChoice = 3
                case "scissorsSegue":
                controller.playerChoice = 2
            default:
                controller.playerChoice = 0
            }
        } else {
            println("There is no segue identifier")
        }

    }
    
    @IBAction func selectRock(sender: AnyObject) {
        
        
        var controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        controller.playerChoice = 1
        controller.computerChoice = self.randomComputerChoice()
        
        println("player value: \(controller.playerChoice)")
        println("value: \(controller.computerChoice)")
        
        self.presentViewController(controller, animated: true, completion: nil)
        
        
    }
    
    @IBAction func selectPaper(sender: AnyObject) {
        performSegueWithIdentifier("paperSegue", sender: self)
        
    }

}

