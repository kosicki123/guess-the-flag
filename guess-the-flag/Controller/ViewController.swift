//
//  ViewController.swift
//  guess-the-flag
//
//  Created by Renan Kosicki on 8/28/15.
//  Copyright (c) 2015 Renan Kosicki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstFlagButton: UIButton!
    @IBOutlet weak var secondFlagButton: UIButton!
    @IBOutlet weak var thirdFlagButton: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCountriesToArray()
        customizeView()
        askQuestion()
    }
    
    func addCountriesToArray() {
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    func customizeView() {
        firstFlagButton.layer.borderWidth = 1
        secondFlagButton.layer.borderWidth = 1
        thirdFlagButton.layer.borderWidth = 1
       
        firstFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        secondFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
        thirdFlagButton.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        firstFlagButton.setImage(UIImage(named: countries[0]), forState: .Normal)
        secondFlagButton.setImage(UIImage(named: countries[1]), forState: .Normal)
        thirdFlagButton.setImage(UIImage(named: countries[2]), forState: .Normal)
        correctAnswer = Int(arc4random_uniform(3))
        title = countries[correctAnswer].uppercaseString
    }
    
    @IBAction func flagSelected(sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Continue", style: .Default, handler: askQuestion)
        alertController.addAction(action)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

