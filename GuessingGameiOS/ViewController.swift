//
//  ViewController.swift
//  GuessingGameiOS
//
//  Created by Noah Smith on 3/12/18.
//  Copyright © 2018 Noah Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessField: UITextField!
    @IBOutlet weak var userFeedbackLabel: UILabel!
    @IBOutlet weak var rulesLabel: UILabel!
    
    var randomNumber = Int(arc4random_uniform(100))
    var numberOfGuess = Int()
    
    var rulesLabelText = """
    ***RULES***
    Rule 1. Guess a number between 0 and 100
    Rule 2. You have 5 tries to guess the number
    Rule 3. You will be given hints
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        
        rulesLabel.textColor = UIColor.black
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        rulesLabel.text = rulesLabelText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func guessButtonPressed(_ sender: Any) {
        if numberOfGuess != 1 {
            numberOfGuess -= 1
            let guess = Int(userGuessField.text!)
            if guess! > randomNumber {
                userFeedbackLabel.lineBreakMode = .byWordWrapping
                userFeedbackLabel.numberOfLines = 0
                userFeedbackLabel.text = "Your guess was too high! Guess again. You have \(numberOfGuess) guesses remaining."
            } else if guess! < randomNumber {
                userFeedbackLabel.lineBreakMode = .byWordWrapping
                userFeedbackLabel.numberOfLines = 0
                userFeedbackLabel.text = "Your guess was too low! Guess again. You have \(numberOfGuess) guesses remaining."
            } else {
                userFeedbackLabel.lineBreakMode = .byWordWrapping
                userFeedbackLabel.numberOfLines = 0
                userFeedbackLabel.text = "You got it right! Congrats!"
            }
        } else {
            userFeedbackLabel.lineBreakMode = .byWordWrapping
            userFeedbackLabel.numberOfLines = 0
            userFeedbackLabel.text = "You ran out of tries. Do you want to play again?"
        }
    }
}
