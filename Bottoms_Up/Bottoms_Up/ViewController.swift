//
//  ViewController.swift
//  Bottoms_Up
//
//  Created by George Schena on 07/06/2017.
//  Copyright © 2017 GS International. All rights reserved.
//

import UIKit
import AudioToolbox
import Social

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
    @IBOutlet weak var bottomsUpTitle: UILabel!
    
    @IBOutlet weak var nextChallengeButton: UIButton!
    @IBOutlet weak var question1View: UIView!
    @IBOutlet weak var questionLabel: UILabel! // Where the question and player name go
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    
    var questionArray : [String] = [" swap drinks with the person next to you", " wear your clothes backwards", " kiss the person next to you", " grind on the person opposite you", " sip your drink upside down", " say the alphabet backwards", " take the persons phone opposite you and post something on Facebook!", " don’t drink for 3 minutes", " you are now banned from drinking from your own glass for 5 minutes", " take two sips if you have had your girlfriend or boyfriend cheat on you", " DOWN YOUR DRINK", " choose a player to take off an item of clothing", " you start. Words beginning with the letter Q, first person to repeat themselves or cant think of a word take 3 sips.", " if you’re wearing boxers take 2 sips", " you are now banned from drinking with your hands", " must speak with a Swiss accent", " if you've slept with someone in this room take 2 sips"," you start. name McDonalds meals, first person to repeat themselves or cant think of a word take 4 sips.", " you start. name porn categories, first person to repeat themselves or cant think of a word take 4 sips.", " if you have slept with more than 10 people take as many sips as sexual partners", " take as many sips as sexual partners", " you start. name sex positions, first person to repeat themselves or cant think of a position take 3 sips.", " you start. name types of spirits, first person to repeat themselves or cant think of one take 3 sips.", "  put an ice cube down the persons top of your choice.", " act like a cat, by crawling on the floor, rubbing your body against people’s legs. Curl up on someone’s lap, and lick your paws.", " gently lick the ear of the person to your left.", " try to make the person next to you laugh. You’ve got 60 seconds.", " pretend you’re having an orgasmic moment and start acting it out.", " say one really nice thing about every player", " say one thing about every player that irritates you", " yell out the first word that comes to your mind right now and take 2 sips", " get everyone to pour some of their drink into one cup and then finish off that drink", " you and all the other guys must take 5 sips", " you and all the other girls must take 5 sips", " choose someone to drink with you for the rest of the game", " you start. name songs by Chris Brown, first person to repeat themselves or cant think of a song take 5 sips."," decide who the tallest player is and then take 3 sips", " decide who the hairiest person is and take 2 sips"]
    
    var playersArray = [UITextField]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.name1.delegate = self
        self.name2.delegate = self
        self.name3.delegate = self
        self.name4.delegate = self
        self.name5.delegate = self
        self.name6.delegate = self
        self.name7.delegate = self
        self.name8.delegate = self
        self.name9.delegate = self
        self.name10.delegate = self
        
        textColor()
        question1View.isHidden = true
        questionLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        questionLabel.lineBreakMode = .byWordWrapping
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        alertMessageOnStartUp()
        whatDeviceIsTheUserUsing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // Alert message on startup
    func alertMessageOnStartUp(){
        let alert = UIAlertController(title: "DRINK WITH CARE!", message: "Please drink responsibly. By continuing, you agree that you and are responsible for any consequences that may result from Bottoms Up.  ", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Agree", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    // Dismiss keyboard when return button is tapped
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
        return (true)
    }
    
    // Dismiss keyboard when tapped outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func shakeAnimation(button: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        button.layer.add(animation, forKey: "shake")
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        self.view.endEditing(true) // Dismiss keyboard when the play button is tapped
        
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
            messageBox.text = ("Enter at least 1 player name")
            self.shakeAnimation(button: messageBox) //Shake animation when the array is empty
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate)) // Vibrate if array is empty
            
        } else {
            let RandomPlayer = playersArray[Int(arc4random_uniform(UInt32(playersArray.count)))]
            let RandomQuestion = questionArray[Int(arc4random_uniform(UInt32(questionArray.count)))]
            questionLabel.text = RandomPlayer.text! + RandomQuestion
            messageBox.isHidden = true
        }
        
    }
    
    @IBAction func nextQuestionButton(_ sender: Any) {
        question1View.backgroundColor = getRandomBackgroundColor()
        
        if playersArray.isEmpty{
            // Nothing needs to happpen as it is dealt within the playButton Function
        } else {
        let RandomPlayer = playersArray[Int(arc4random_uniform(UInt32(playersArray.count)))]
        let RandomQuestion = questionArray[Int(arc4random_uniform(UInt32(questionArray.count)))]
        questionLabel.text = RandomPlayer.text! + RandomQuestion
        }
    }
    
    @IBAction func facebookShareButton(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            self.present(fbShare, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func twitterShareButton(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            
            let tweetShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            self.present(tweetShare, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func whatDeviceIsTheUserUsing(){
        let screenSizeHeight = UIScreen.main.bounds.size.height
        
        if screenSizeHeight == 568 { // (320 x 568) SE,5 (DONE)
            
            question1View.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
            questionLabel.center = self.view.center
            questionLabel.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
            nextChallengeButton.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
            
            bottomsUpTitle.frame = CGRect(x: CGFloat(-44), y: CGFloat(1), width: CGFloat(bottomsUpTitle.frame.size.width), height: CGFloat(bottomsUpTitle.frame.size.height))
            
            name1.frame = CGRect(x: CGFloat(100), y: CGFloat(125), width: CGFloat(name1.frame.size.width), height: CGFloat(name1.frame.size.height))
            
            name2.frame = CGRect(x: CGFloat(100), y: CGFloat(155), width: CGFloat(name2.frame.size.width), height: CGFloat(name2.frame.size.height))
            
            name3.frame = CGRect(x: CGFloat(100), y: CGFloat(185), width: CGFloat(name3.frame.size.width), height: CGFloat(name3.frame.size.height))
            
            name4.frame = CGRect(x: CGFloat(100), y: CGFloat(215), width: CGFloat(name4.frame.size.width), height: CGFloat(name4.frame.size.height))
            
            name5.frame = CGRect(x: CGFloat(100), y: CGFloat(245), width: CGFloat(name5.frame.size.width), height: CGFloat(name5.frame.size.height))
            
            name6.frame = CGRect(x: CGFloat(100), y: CGFloat(275), width: CGFloat(name6.frame.size.width), height: CGFloat(name6.frame.size.height))
            
            name7.frame = CGRect(x: CGFloat(100), y: CGFloat(305), width: CGFloat(name7.frame.size.width), height: CGFloat(name7.frame.size.height))
            
            name8.frame = CGRect(x: CGFloat(100), y: CGFloat(335), width: CGFloat(name8.frame.size.width), height: CGFloat(name8.frame.size.height))
            
            name9.frame = CGRect(x: CGFloat(100), y: CGFloat(365), width: CGFloat(name9.frame.size.width), height: CGFloat(name9.frame.size.height))
            
            name10.frame = CGRect(x: CGFloat(100), y: CGFloat(395), width: CGFloat(name10.frame.size.width), height: CGFloat(name10.frame.size.height))
            
            playButton.frame = CGRect(x: CGFloat(115), y: CGFloat(430), width: CGFloat(playButton.frame.size.width), height: CGFloat(playButton.frame.size.height))
            
            messageBox.frame = CGRect(x: CGFloat(-35), y: CGFloat(480), width: CGFloat(messageBox.frame.size.width), height: CGFloat(messageBox.frame.size.height))
            
            facebookButton.frame = CGRect(x: CGFloat(115), y: CGFloat(513), width: CGFloat(facebookButton.frame.size.width), height: CGFloat(facebookButton.frame.size.height))
            
            twitterButton.frame = CGRect(x: CGFloat(163), y: CGFloat(510), width: CGFloat(twitterButton.frame.size.width), height: CGFloat(twitterButton.frame.size.height))
            }
            
            else if screenSizeHeight == 667 { //(375 x 667) 7 (DONE)
            
            question1View.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            questionLabel.center = self.view.center
            questionLabel.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            nextChallengeButton.frame = CGRect(x: 0, y: 0, width: 375, height: 667)

            bottomsUpTitle.frame = CGRect(x: CGFloat(-25), y: CGFloat(1), width: CGFloat(bottomsUpTitle.frame.size.width), height: CGFloat(bottomsUpTitle.frame.size.height))
            
            name1.frame = CGRect(x: CGFloat(125), y: CGFloat(155), width: CGFloat(name1.frame.size.width), height: CGFloat(name1.frame.size.height))
            
            name2.frame = CGRect(x: CGFloat(125), y: CGFloat(185), width: CGFloat(name2.frame.size.width), height: CGFloat(name2.frame.size.height))
            
            name3.frame = CGRect(x: CGFloat(125), y: CGFloat(215), width: CGFloat(name3.frame.size.width), height: CGFloat(name3.frame.size.height))
            
            name4.frame = CGRect(x: CGFloat(125), y: CGFloat(245), width: CGFloat(name4.frame.size.width), height: CGFloat(name4.frame.size.height))
            
            name5.frame = CGRect(x: CGFloat(125), y: CGFloat(275), width: CGFloat(name5.frame.size.width), height: CGFloat(name5.frame.size.height))
            
            name6.frame = CGRect(x: CGFloat(125), y: CGFloat(305), width: CGFloat(name6.frame.size.width), height: CGFloat(name6.frame.size.height))
            
            name7.frame = CGRect(x: CGFloat(125), y: CGFloat(335), width: CGFloat(name7.frame.size.width), height: CGFloat(name7.frame.size.height))
            
            name8.frame = CGRect(x: CGFloat(125), y: CGFloat(365), width: CGFloat(name8.frame.size.width), height: CGFloat(name8.frame.size.height))
            
            name9.frame = CGRect(x: CGFloat(125), y: CGFloat(395), width: CGFloat(name9.frame.size.width), height: CGFloat(name9.frame.size.height))
            
            name10.frame = CGRect(x: CGFloat(125), y: CGFloat(425), width: CGFloat(name10.frame.size.width), height: CGFloat(name10.frame.size.height))
            
            playButton.frame = CGRect(x: CGFloat(140), y: CGFloat(460), width: CGFloat(playButton.frame.size.width), height: CGFloat(playButton.frame.size.height))
            
            messageBox.frame = CGRect(x: CGFloat(-10), y: CGFloat(510), width: CGFloat(messageBox.frame.size.width), height: CGFloat(messageBox.frame.size.height))
            
            facebookButton.frame = CGRect(x: CGFloat(140), y: CGFloat(617), width: CGFloat(facebookButton.frame.size.width), height: CGFloat(facebookButton.frame.size.height))
            
            twitterButton.frame = CGRect(x: CGFloat(195), y: CGFloat(614), width: CGFloat(twitterButton.frame.size.width), height: CGFloat(twitterButton.frame.size.height))
            }
            
            
            else if screenSizeHeight == 736{ // (414 x 736) PLUS (DONE)
            
            question1View.frame = CGRect(x: 0, y: 0, width: 414, height: 736)
            questionLabel.center = self.view.center
            questionLabel.frame = CGRect(x: 0, y: 0, width: 414, height: 736)
            nextChallengeButton.frame = CGRect(x: 0, y: 0, width: 414, height: 736)

            bottomsUpTitle.frame = CGRect(x: CGFloat(-5), y: CGFloat(20), width: CGFloat(bottomsUpTitle.frame.size.width), height: CGFloat(bottomsUpTitle.frame.size.height))
            
            name1.frame = CGRect(x: CGFloat(145), y: CGFloat(130), width: CGFloat(name1.frame.size.width), height: CGFloat(name1.frame.size.height))
            
            name2.frame = CGRect(x: CGFloat(145), y: CGFloat(160), width: CGFloat(name2.frame.size.width), height: CGFloat(name2.frame.size.height))
            
            name3.frame = CGRect(x: CGFloat(145), y: CGFloat(190), width: CGFloat(name3.frame.size.width), height: CGFloat(name3.frame.size.height))
            
            name4.frame = CGRect(x: CGFloat(145), y: CGFloat(220), width: CGFloat(name4.frame.size.width), height: CGFloat(name4.frame.size.height))
            
            name5.frame = CGRect(x: CGFloat(145), y: CGFloat(250), width: CGFloat(name5.frame.size.width), height: CGFloat(name5.frame.size.height))
            
            name6.frame = CGRect(x: CGFloat(145), y: CGFloat(280), width: CGFloat(name6.frame.size.width), height: CGFloat(name6.frame.size.height))
            
            name7.frame = CGRect(x: CGFloat(145), y: CGFloat(310), width: CGFloat(name7.frame.size.width), height: CGFloat(name7.frame.size.height))
            
            name8.frame = CGRect(x: CGFloat(145), y: CGFloat(340), width: CGFloat(name8.frame.size.width), height: CGFloat(name8.frame.size.height))
            
            name9.frame = CGRect(x: CGFloat(145), y: CGFloat(370), width: CGFloat(name9.frame.size.width), height: CGFloat(name9.frame.size.height))
            
            name10.frame = CGRect(x: CGFloat(145), y: CGFloat(400), width: CGFloat(name10.frame.size.width), height: CGFloat(name10.frame.size.height))
            
            playButton.frame = CGRect(x: CGFloat(160), y: CGFloat(435), width: CGFloat(playButton.frame.size.width), height: CGFloat(playButton.frame.size.height))
            
            messageBox.frame = CGRect(x: CGFloat(5), y: CGFloat(485), width: CGFloat(messageBox.frame.size.width), height: CGFloat(messageBox.frame.size.height))
            
            facebookButton.frame = CGRect(x: CGFloat(145), y: CGFloat(680), width: CGFloat(facebookButton.frame.size.width), height: CGFloat(facebookButton.frame.size.height))
            
            twitterButton.frame = CGRect(x: CGFloat(198), y: CGFloat(680), width: CGFloat(twitterButton.frame.size.width), height: CGFloat(twitterButton.frame.size.height))
            }
        
            else if screenSizeHeight == 1024{ // (768 x 1024) IPAD MINI, AIR (DONE)
            
            question1View.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
            questionLabel.center = self.view.center
            questionLabel.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
            nextChallengeButton.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
            questionLabel.font = questionLabel.font.withSize(35) //Size for ipads

            bottomsUpTitle.frame = CGRect(x: CGFloat(172), y: CGFloat(28), width: CGFloat(bottomsUpTitle.frame.size.width), height: CGFloat(bottomsUpTitle.frame.size.height))
            
            name1.frame = CGRect(x: CGFloat(320), y: CGFloat(120), width: CGFloat(name1.frame.size.width), height: CGFloat(name1.frame.size.height))
            
            name2.frame = CGRect(x: CGFloat(320), y: CGFloat(150), width: CGFloat(name2.frame.size.width), height: CGFloat(name2.frame.size.height))
            
            name3.frame = CGRect(x: CGFloat(320), y: CGFloat(180), width: CGFloat(name3.frame.size.width), height: CGFloat(name3.frame.size.height))
            
            name4.frame = CGRect(x: CGFloat(320), y: CGFloat(210), width: CGFloat(name4.frame.size.width), height: CGFloat(name4.frame.size.height))
            
            name5.frame = CGRect(x: CGFloat(320), y: CGFloat(240), width: CGFloat(name5.frame.size.width), height: CGFloat(name5.frame.size.height))
            
            name6.frame = CGRect(x: CGFloat(320), y: CGFloat(270), width: CGFloat(name6.frame.size.width), height: CGFloat(name6.frame.size.height))
            
            name7.frame = CGRect(x: CGFloat(320), y: CGFloat(300), width: CGFloat(name7.frame.size.width), height: CGFloat(name7.frame.size.height))
            
            name8.frame = CGRect(x: CGFloat(320), y: CGFloat(330), width: CGFloat(name8.frame.size.width), height: CGFloat(name8.frame.size.height))
            
            name9.frame = CGRect(x: CGFloat(320), y: CGFloat(360), width: CGFloat(name9.frame.size.width), height: CGFloat(name9.frame.size.height))
            
            name10.frame = CGRect(x: CGFloat(320), y: CGFloat(390), width: CGFloat(name10.frame.size.width), height: CGFloat(name10.frame.size.height))
            
            playButton.frame = CGRect(x: CGFloat(336), y: CGFloat(424), width: CGFloat(playButton.frame.size.width), height: CGFloat(playButton.frame.size.height))
            
            messageBox.frame = CGRect(x: CGFloat(180), y: CGFloat(475), width: CGFloat(messageBox.frame.size.width), height: CGFloat(messageBox.frame.size.height))
            
            facebookButton.frame = CGRect(x: CGFloat(333), y: CGFloat(951), width: CGFloat(facebookButton.frame.size.width), height: CGFloat(facebookButton.frame.size.height))
            
            twitterButton.frame = CGRect(x: CGFloat(378), y: CGFloat(948), width: CGFloat(twitterButton.frame.size.width), height: CGFloat(twitterButton.frame.size.height))
            }
        
            else if screenSizeHeight == 1366{ // (1024 x 1366) IPAD PRO (DONE)
            
            question1View.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
            questionLabel.center = self.view.center
            questionLabel.frame = CGRect(x: 0, y: 0, width: 1024, height: 1336)
            nextChallengeButton.frame = CGRect(x: 0, y: 0, width: 1024, height: 1366)
            questionLabel.font = questionLabel.font.withSize(35)

            bottomsUpTitle.frame = CGRect(x: CGFloat(300), y: CGFloat(28), width: CGFloat(bottomsUpTitle.frame.size.width), height: CGFloat(bottomsUpTitle.frame.size.height))
            
            name1.frame = CGRect(x: CGFloat(450), y: CGFloat(130), width: CGFloat(name1.frame.size.width), height: CGFloat(name1.frame.size.height))

            name2.frame = CGRect(x: CGFloat(450), y: CGFloat(160), width: CGFloat(name2.frame.size.width), height: CGFloat(name2.frame.size.height))

            name3.frame = CGRect(x: CGFloat(450), y: CGFloat(190), width: CGFloat(name3.frame.size.width), height: CGFloat(name3.frame.size.height))

            name4.frame = CGRect(x: CGFloat(450), y: CGFloat(220), width: CGFloat(name4.frame.size.width), height: CGFloat(name4.frame.size.height))

            name5.frame = CGRect(x: CGFloat(450), y: CGFloat(250), width: CGFloat(name5.frame.size.width), height: CGFloat(name5.frame.size.height))

            name6.frame = CGRect(x: CGFloat(450), y: CGFloat(280), width: CGFloat(name6.frame.size.width), height: CGFloat(name6.frame.size.height))

            name7.frame = CGRect(x: CGFloat(450), y: CGFloat(310), width: CGFloat(name7.frame.size.width), height: CGFloat(name7.frame.size.height))

            name8.frame = CGRect(x: CGFloat(450), y: CGFloat(340), width: CGFloat(name8.frame.size.width), height: CGFloat(name8.frame.size.height))

            name9.frame = CGRect(x: CGFloat(450), y: CGFloat(370), width: CGFloat(name9.frame.size.width), height: CGFloat(name9.frame.size.height))

            name10.frame = CGRect(x: CGFloat(450), y: CGFloat(400), width: CGFloat(name10.frame.size.width), height: CGFloat(name10.frame.size.height))
            
            playButton.frame = CGRect(x: CGFloat(465), y: CGFloat(435), width: CGFloat(playButton.frame.size.width), height: CGFloat(playButton.frame.size.height))
            
            messageBox.frame = CGRect(x: CGFloat(310), y: CGFloat(490), width: CGFloat(messageBox.frame.size.width), height: CGFloat(messageBox.frame.size.height))

            facebookButton.frame = CGRect(x: CGFloat(465), y: CGFloat(1305), width: CGFloat(facebookButton.frame.size.width), height: CGFloat(facebookButton.frame.size.height))

            twitterButton.frame = CGRect(x: CGFloat(510), y: CGFloat(1302), width: CGFloat(twitterButton.frame.size.width), height: CGFloat(twitterButton.frame.size.height))
            }
        
            else if screenSizeHeight == 812 { //iPhone X
            
            question1View.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
            questionLabel.center = self.view.center
            questionLabel.frame = CGRect(x: 0, y: 40, width: 375, height: 750)
            nextChallengeButton.frame = CGRect(x: 0, y: 0, width: 375, height: 812)
            
            bottomsUpTitle.frame = CGRect(x: CGFloat(-25), y: CGFloat(23), width: CGFloat(bottomsUpTitle.frame.size.width), height: CGFloat(bottomsUpTitle.frame.size.height))
            
            name1.frame = CGRect(x: CGFloat(125), y: CGFloat(120), width: CGFloat(name1.frame.size.width), height: CGFloat(name1.frame.size.height))
            
            name2.frame = CGRect(x: CGFloat(125), y: CGFloat(150), width: CGFloat(name2.frame.size.width), height: CGFloat(name2.frame.size.height))
            
            name3.frame = CGRect(x: CGFloat(125), y: CGFloat(180), width: CGFloat(name3.frame.size.width), height: CGFloat(name3.frame.size.height))
            
            name4.frame = CGRect(x: CGFloat(125), y: CGFloat(210), width: CGFloat(name4.frame.size.width), height: CGFloat(name4.frame.size.height))
            
            name5.frame = CGRect(x: CGFloat(125), y: CGFloat(240), width: CGFloat(name5.frame.size.width), height: CGFloat(name5.frame.size.height))
            
            name6.frame = CGRect(x: CGFloat(125), y: CGFloat(270), width: CGFloat(name6.frame.size.width), height: CGFloat(name6.frame.size.height))
            
            name7.frame = CGRect(x: CGFloat(125), y: CGFloat(300), width: CGFloat(name7.frame.size.width), height: CGFloat(name7.frame.size.height))
            
            name8.frame = CGRect(x: CGFloat(125), y: CGFloat(330), width: CGFloat(name8.frame.size.width), height: CGFloat(name8.frame.size.height))
            
            name9.frame = CGRect(x: CGFloat(125), y: CGFloat(360), width: CGFloat(name9.frame.size.width), height: CGFloat(name9.frame.size.height))
            
            name10.frame = CGRect(x: CGFloat(125), y: CGFloat(390), width: CGFloat(name10.frame.size.width), height: CGFloat(name10.frame.size.height))
            
            playButton.frame = CGRect(x: CGFloat(140), y: CGFloat(430), width: CGFloat(playButton.frame.size.width), height: CGFloat(playButton.frame.size.height))
            
            messageBox.frame = CGRect(x: CGFloat(-15), y: CGFloat(480), width: CGFloat(messageBox.frame.size.width), height: CGFloat(messageBox.frame.size.height))
            
            facebookButton.frame = CGRect(x: CGFloat(130), y: CGFloat(725), width: CGFloat(facebookButton.frame.size.width), height: CGFloat(facebookButton.frame.size.height))
            
            twitterButton.frame = CGRect(x: CGFloat(180), y: CGFloat(722), width: CGFloat(twitterButton.frame.size.width), height: CGFloat(twitterButton.frame.size.height))
        }
            }
        }
    


