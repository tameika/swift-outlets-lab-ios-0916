//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func redGuess(sender: UIButton)  {
        print("red button pressed")
        simonSaysGame.guessRed()
        buttonsClicked += 1
        gameResult()
    
        
    }
   
    @IBAction func greenGuess(sender: UIButton)  {
        print("green button pressed")
        simonSaysGame.guessGreen()
        buttonsClicked += 1
        gameResult()
    }
    
    @IBAction func yellowGuess(sender: UIButton) {
        print("yellow button pressed")
        simonSaysGame.guessYellow()
        buttonsClicked += 1
        gameResult()
        
    }
    
    @IBAction func blueGuess(sender: UIButton) {
        print("blue button pressed")
        simonSaysGame.guessBlue()
        buttonsClicked += 1
        gameResult()
        
    }
    
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    var simonSaysGame = SimonSays()
    var buttonsClicked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
    }
    
    
    func gameResult() {
        
        if buttonsClicked == 5 {
        
            if simonSaysGame.wonGame() {
            
                winLabel.text = "You won!"
            
            
            } else {
            
                winLabel.text = "Nope, try again."
            
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: .TransitionFlipFromBottom , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        
        displayTheColors()
    }
    
    private func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: .TransitionCurlUp, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    }
  
    
    


}



