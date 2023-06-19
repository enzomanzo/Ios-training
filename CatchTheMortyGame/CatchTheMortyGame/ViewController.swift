//
//  ViewController.swift
//  CatchTheMortyGame
//
//  Created by Enzo Manzo Carelli on 14/06/23.
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    var timer = Timer()
    var counter = 0
    var mortyArray = [UIImageView] ()
    var hideTimer = Timer()
    var highScore = 0
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var morty1: UIImageView!
    @IBOutlet weak var morty2: UIImageView!
    @IBOutlet weak var morty3: UIImageView!
    @IBOutlet weak var morty4: UIImageView!
    @IBOutlet weak var morty5: UIImageView!
    @IBOutlet weak var morty6: UIImageView!
    @IBOutlet weak var morty7: UIImageView!
    @IBOutlet weak var morty8: UIImageView!
    @IBOutlet weak var morty9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Score: \(score)"
        
        //HighScore check
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highscoreLabel.text = "HighScore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highscoreLabel.text = "HighScore: \(highScore)"
        }
        
        morty1.isUserInteractionEnabled = true
        morty2.isUserInteractionEnabled = true
        morty3.isUserInteractionEnabled = true
        morty4.isUserInteractionEnabled = true
        morty5.isUserInteractionEnabled = true
        morty6.isUserInteractionEnabled = true
        morty7.isUserInteractionEnabled = true
        morty8.isUserInteractionEnabled = true
        morty9.isUserInteractionEnabled = true

        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))

        morty1.addGestureRecognizer(recognizer1)
        morty2.addGestureRecognizer(recognizer2)
        morty3.addGestureRecognizer(recognizer3)
        morty4.addGestureRecognizer(recognizer4)
        morty5.addGestureRecognizer(recognizer5)
        morty6.addGestureRecognizer(recognizer6)
        morty7.addGestureRecognizer(recognizer7)
        morty8.addGestureRecognizer(recognizer8)
        morty9.addGestureRecognizer(recognizer9)

        mortyArray = [morty1, morty2, morty3, morty4, morty5, morty6, morty7, morty8, morty9]
        

        
        //Timers
        counter = 30
        timeLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(hideMorty), userInfo: nil, repeats: true)
        
        
        hideMorty()
        
    }
    
    @objc func hideMorty(){
        
        for morty in mortyArray {
            morty.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(mortyArray.count - 1)))
        mortyArray[random].isHidden = false
    }

    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for morty in mortyArray {
                morty.isHidden = true
            }
            
            
            //Highscore
            if self.score > self.highScore {
                self.highScore = self.score
                highscoreLabel.text = "HighScore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
                
            //alert
            let alert = UIAlertController(title: "Time`s Over", message: "Do you want do play again? ", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay Function
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.hideMorty), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }

}

