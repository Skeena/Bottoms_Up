//
//  ViewController.swift
//  Bottoms_Up
//
//  Created by George Schena on 07/06/2017.
//  Copyright © 2017 GS International. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
    @IBOutlet weak var name3: UITextField!
    @IBOutlet weak var name4: UITextField!
    @IBOutlet weak var name5: UITextField!
    @IBOutlet weak var name6: UITextField!
    
    @IBOutlet weak var question1View: UIView!
    @IBOutlet weak var questionLabel: UILabel! // Where the question and player name go
    
    var questionArray : [String] = [" down Your Drink!", " swap drinks with the person next to you", " wear your clothes backwards", " kiss the person next to you", " grind on the person opposite you", " drink your drink upside down", " say the alphabet backwards"]
    
    var playersArray = [UITextField]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textColor()
        question1View.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // Dismiss keyboard when tapped outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    // Dimiss keybaord when return button is tapped
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name1.resignFirstResponder()
        name2.resignFirstResponder()
        name3.resignFirstResponder()
        name4.resignFirstResponder()
        name5.resignFirstResponder()
        name6.resignFirstResponder()
        return(true)
    }
    //When button pressed randomise background colour of each question page
    func getRandomBackgroundColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
        func textColor(){
        name1.textColor = UIColor.white
        name2.textColor = UIColor.white
        name3.textColor = UIColor.white
        name4.textColor = UIColor.white
        name5.textColor = UIColor.white
        name6.textColor = UIColor.white
    }
    
    @IBAction func playButton(_ sender: Any) {
        playersArray.append(name1)
        playersArray.append(name2)
        playersArray.append(name3)
        playersArray.append(name4)
        playersArray.append(name5)
        playersArray.append(name6)

        question1View.isHidden = false
        question1View.backgroundColor = getRandomBackgroundColor()
    
        let RandomPlayer = playersArray[Int(arc4random_uniform(UInt32(playersArray.count)))]
        let RandomQuestion = questionArray[Int(arc4random_uniform(UInt32(questionArray.count)))]
        questionLabel.text = RandomPlayer.text! + RandomQuestion
    }
    
    @IBAction func nextQuestionButton(_ sender: Any) {
        question1View.backgroundColor = getRandomBackgroundColor()
        
        let RandomPlayer = playersArray[Int(arc4random_uniform(UInt32(playersArray.count)))]
        let RandomQuestion = questionArray[Int(arc4random_uniform(UInt32(questionArray.count)))]
        questionLabel.text = RandomPlayer.text! + RandomQuestion
    }
}

