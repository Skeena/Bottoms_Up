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
    @IBOutlet weak var name7: UITextField!
    @IBOutlet weak var name8: UITextField!
    @IBOutlet weak var name9: UITextField!
    @IBOutlet weak var name10: UITextField!
        
    @IBOutlet weak var messageBox: UILabel! //Alert user that a player must be entered
    
    @IBOutlet weak var question1View: UIView!
    @IBOutlet weak var questionLabel: UILabel! // Where the question and player name go
    
    var questionArray : [String] = [" swap drinks with the person next to you", " wear your clothes backwards", " kiss the person next to you", " grind on the person opposite you", " drink your drink upside down", " say the alphabet backwards", " take the persons phone opposite you and post something on Facebook!", " dont drink for 3 minutes", " you are now banned from drining from your own glass for 5 minutes", " drink twice if you have had your girlfriend or boyfriend cheat on you", " DOWN YOUR DRINK", " choose a player to take off an item of clothing", " you start. Words beginning with Q, first person to repeat themselves or cant think of a word drink 5 times.", " if your'e wearing boxers drink 3 times", " you are now banned from drinking with ur hands", " must speak with a swiss accent", " if you've slept with someone in this room drink 2 times"," you start. name McDonalds meals, first person to repeat themselves or cant think of a word drink 3 times.", " you start. name porn catagories, first person to repeat themselves or cant think of a word drink 5 times.", " if you have slept with more than 10 people drink the number 5 times", " take as many sips as sexual partners", " you start. name sex positions, first person to repeat themselves or cant think of a position drink 5 times.", " you start. name types of spirits, first person to repeat themselves or cant think of one drink 3 times.", "  put an ice cube down the persons top of your choice.", " act like a cat, by crawling on the floor, rubbing your body against people’s legs. Curl up on someone’s lap, and lick your paws.", " gently lick the ear of the person to your left.", " try to make the person next to you laugh. You’ve got 60 seconds.", " pretend you’re having an orgasmic moment and start acting it out.", " say one really nice thing about every player", " say one thing about every player that irritates you", " yell out the first word that comes to your mind right now and drink 4 times", " get everyone to pour abit of their drink into one cup and then down that drink", " you and all the other guys must take 5 sips", " you and all the other girls must take 5 sips", " choose someone to drink with you for the rest of the game", " you start. name songs by Chris Bown, first person to repeat themselves or cant think of a song drink 7 times."]
    
    var playersArray = [UITextField]()

    override func viewDidLoad() {
        super.viewDidLoad()
        textColor()
        question1View.isHidden = true
        questionLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Alert message on startup
    func alertMessageOnStartUp(){
        let alert = UIAlertController(title: "Warning!", message: "Please drink responsibly. By continuing, you agree that you are responsible for any consequences that may result from BottomsUp.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Agree", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        name7.resignFirstResponder()
        name8.resignFirstResponder()
        name9.resignFirstResponder()
        name10.resignFirstResponder()
        return(true)
    }
    
    //randomise background colour of each question page
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
        name7.textColor = UIColor.white
        name8.textColor = UIColor.white
        name9.textColor = UIColor.white
        name10.textColor = UIColor.white
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        if let player1Name = name1.text, !player1Name.isEmpty
        {   playersArray.append(name1)
            
        } else {
            print("Player 1 is Empty")
        }
        
        if let player2Name = name2.text, !player2Name.isEmpty
        {   playersArray.append(name2)
            
        } else {
            print("Player 2 is Empty")
        }
        
        if let player3Name = name3.text, !player3Name.isEmpty
        {   playersArray.append(name3)
            
        } else {
            print("Player 3 is Empty")
        }
        
        if let player4Name = name4.text, !player4Name.isEmpty
        {   playersArray.append(name4)
            
        } else {
            print("Player 4 is Empty")
        }
        
        if let player5Name = name5.text, !player5Name.isEmpty
        {   playersArray.append(name5)
            
        } else {
            print("Player 5 is Empty")
        }
        
        if let player6Name = name6.text, !player6Name.isEmpty
        {   playersArray.append(name6)
            
        } else {
            print("Player 6 is Empty")
        }
        
        if let player7Name = name7.text, !player7Name.isEmpty
        {   playersArray.append(name7)
            
        } else {
            print("Player 7 is Empty")
        }
        
        if let player8Name = name8.text, !player8Name.isEmpty
        {   playersArray.append(name8)
            
        } else {
            print("Player 8 is Empty")
        }
        
        if let player9Name = name9.text, !player9Name.isEmpty
        {   playersArray.append(name9)
            
        } else {
            print("Player 9 is Empty")
        }
        
        if let player10Name = name10.text, !player10Name.isEmpty
        {   playersArray.append(name10)
            
        } else {
            print("Player 10 is Empty")
        }
        
        question1View.isHidden = false
        question1View.backgroundColor = getRandomBackgroundColor()
        
        if playersArray.isEmpty{
            print("The array is empty")
            question1View.isHidden = true
            messageBox.text = ("Enter at lesat 1 player name")
        } else {
            alertMessageOnStartUp()
            let RandomPlayer = playersArray[Int(arc4random_uniform(UInt32(playersArray.count)))]
            let RandomQuestion = questionArray[Int(arc4random_uniform(UInt32(questionArray.count)))]
            questionLabel.text = RandomPlayer.text! + RandomQuestion
        }
    }
    
    @IBAction func nextQuestionButton(_ sender: Any) {
        question1View.backgroundColor = getRandomBackgroundColor()
        
        if playersArray.isEmpty{
            // Nothing needs to happpen as it is dealt with in the playButton Function
        } else {
        let RandomPlayer = playersArray[Int(arc4random_uniform(UInt32(playersArray.count)))]
        let RandomQuestion = questionArray[Int(arc4random_uniform(UInt32(questionArray.count)))]
        questionLabel.text = RandomPlayer.text! + RandomQuestion
        }
    }
}

