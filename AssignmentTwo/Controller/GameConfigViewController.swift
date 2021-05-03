//
//  GameConfigViewController.swift
//  AssignmentTwo
//
//  Created by Fisch on 24/4/21.
//

import UIKit

class GameConfigViewController: UIViewController {

    var gameDuration:Int = 60
    var bubbles = 15
    var name:String = ""
    
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var gameTime: UISlider!
    @IBOutlet weak var timeIndicator: UILabel!
    @IBOutlet weak var bubbleAmount: UISlider!
    @IBOutlet weak var bubblesIndicator: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTime.value = Float(UserDefaults.standard.integer(forKey: "gameTime"))
        bubbleAmount.value = Float(UserDefaults.standard.integer(forKey: "bubbleAmount"))
        timeIndicator.text = String(Int(gameTime.value))
        bubblesIndicator.text = String(Int(bubbleAmount.value))
    }
    
    @IBAction func setName(_ sender: UITextField) {
        name = sender.text ?? "Unknown Player"
    }
    
    @IBAction func setTimer(_ sender: UISlider) {
        gameDuration = Int(sender.value)
        timeIndicator.text = "\(gameDuration)"
       
    }
    
    @IBAction func setBubble(_ sender: UISlider) {
        bubbles = Int(sender.value)
        bubblesIndicator.text = "\(bubbles)"
    }
    
    @IBAction func saveSettings(_ sender: UIButton) {
        UserDefaults.standard.set(name, forKey: "playerName")
        UserDefaults.standard.set(gameDuration,forKey: "gameTime")
        UserDefaults.standard.set(bubbles,forKey: "bubbleAmount")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "newGame" {
//            let viewController = segue.destination as! GameViewController
//            viewController.playerName = name
//            viewController.gameTime = gameDuration
//            viewController.bubbleAmount = bubbles
//        }
//    }


}
