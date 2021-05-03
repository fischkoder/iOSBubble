//
//  GameViewController.swift
//  AssignmentTwo
//
//  Created by Fisch on 24/4/21.
//

import UIKit

class GameViewController: UIViewController {
    
    var playerName:String = ""
    var gameTime:Int = 60
    var bubbleAmount:Int = 15
    var gameTimer:Timer?
    var bubbleBox = [Bubble]()
    var thisRoundScore:Double = 0
    var historyHighScore:Double = 0
    var lastTapScore:Double = 0
    var historyDictionary:Dictionary = [String:Double]()
    var retrieveUserDefault:Dictionary? = [String:Double]()
    var rankingArray = [(key:String, value:Double)]()

    
    @IBOutlet weak var namePlace: UINavigationItem!
    @IBOutlet weak var timePlace: UILabel!
    @IBOutlet weak var scorePlace: UILabel!
    @IBOutlet weak var highScorePlace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerName = UserDefaults.standard.string(forKey: "playerName")!
        gameTime = UserDefaults.standard.integer(forKey: "gameTime")
        bubbleAmount = UserDefaults.standard.integer(forKey: "bubbleAmount")
        namePlace.title = playerName
        timePlace.text = "\(gameTime)"
        scorePlace.text = "\(thisRoundScore)"
        //TODO load History
        retrieveUserDefault = UserDefaults.standard.dictionary(forKey: "HighScore") as? Dictionary<String, Double>
        if retrieveUserDefault != nil {
            historyDictionary = retrieveUserDefault!
            rankingArray = historyDictionary.sorted(by: {$0.value > $1.value})
            highScorePlace.text = "\(rankingArray[0].value)"
        }
        
        gameTimer = Timer.scheduledTimer(withTimeInterval:1, repeats: true) {
            timer in
            self.countDown()
            //print(self.gameTime)
            self.createBubble()
            self.removeBubble()
        }
        // Do any additional setup after loading the view.
    }
    
    func countDown() {
        timePlace.text = "\(gameTime)"
        if gameTime == 0 {
            gameTimer?.invalidate()
            updateHighScore()
            let scoreBoardView = self.storyboard?.instantiateViewController(identifier: "BoardNaviViewController") as! BoardNaviViewController
            self.present(scoreBoardView, animated: true)
        }else{
            gameTime -= 1
        }
    }
    
    func createBubble() {
        let amountOfBubble = bubbleAmount
        let newAmountOfBubble = Int.random(in: 1...(amountOfBubble - bubbleBox.count))
        var i = 0
        while i < newAmountOfBubble {
            let bubble = Bubble()
            //TODO check overlap of every bubble
            if checkOverlap(bubble) == false {
                bubbleBox += [bubble]
                //TODO add bubbles to display layer
                bubble.addTarget(self, action: #selector(tapBubble), for: .touchDown)
                self.view.addSubview(bubble)
                //this animation is for show up
                bubble.animation()
                i += 1
            }
            print(checkOverlap(bubble))
        }
    }
    
    func removeBubble() {
        if bubbleBox.count > 0 {
            let randomNumber = Int.random(in: 1...(bubbleBox.count / 2))
            var i = 0
            while i < randomNumber {
                bubbleBox[0].removeFromSuperview()
                bubbleBox.remove(at: 0)
                i += 1
            }
        }
    }
    
    @IBAction func tapBubble(_ tapped: Bubble){
        tapped.animation()
        tapped.removeFromSuperview()
        //Change score
        if lastTapScore == tapped.score {
            thisRoundScore += 1.5 * tapped.score
        } else {
            thisRoundScore += tapped.score
        }
        lastTapScore = tapped.score
        scorePlace.text = "\(thisRoundScore)"
        
        //TODO set History
        if retrieveUserDefault == nil {
            highScorePlace.text = "\(thisRoundScore)"
        } else if rankingArray[0].value > thisRoundScore {
            highScorePlace.text = "\(rankingArray[0].value)"
        } else if rankingArray[0].value < thisRoundScore {
            highScorePlace.text = "\(thisRoundScore)"
        }
        
    }
    
    func updateHighScore() {
        if retrieveUserDefault != nil {
            if retrieveUserDefault!.keys.contains("\(playerName)"){
                let score:Double = retrieveUserDefault!["\(playerName)"]!
                if thisRoundScore > score {
                    historyDictionary.updateValue(thisRoundScore, forKey: "\(playerName)")
                    UserDefaults.standard.set(historyDictionary, forKey: "HighScore")
                }
            } else {
                historyDictionary.updateValue(thisRoundScore, forKey: "\(playerName)")
                UserDefaults.standard.set(historyDictionary, forKey: "HighScore")
            }
        } else {
            historyDictionary.updateValue(thisRoundScore, forKey: "\(playerName)")
            UserDefaults.standard.set(historyDictionary, forKey: "HighScore")
        }
    }

    func checkOverlap(_ target: Bubble) -> Bool {
        for bubble in bubbleBox {
            if bubble.frame.intersects(target.frame){
                return true
            }
        }
        return false
    }

}
