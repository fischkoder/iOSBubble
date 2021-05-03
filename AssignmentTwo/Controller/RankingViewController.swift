//
//  RankingViewController.swift
//  AssignmentTwo
//
//  Created by Fisch on 24/4/21.
//

import UIKit

class RankingViewController: UIViewController {

    @IBOutlet weak var slot1: UILabel!
    @IBOutlet weak var slot1Score: UILabel!
    
    @IBOutlet weak var slot2: UILabel!
    @IBOutlet weak var slot2Score: UILabel!
    
    @IBOutlet weak var slot3: UILabel!
    @IBOutlet weak var slot3Score: UILabel!
    
    var historyDictionary:Dictionary = [String:Double]()
    var retrieveUserDefault:Dictionary? = [String:Double]()
    var rankingArray = [(key:String, value:Double)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveUserDefault = UserDefaults.standard.dictionary(forKey: "HighScore") as? Dictionary<String, Double>
        if retrieveUserDefault != nil {
            historyDictionary = retrieveUserDefault!
            rankingArray = historyDictionary.sorted(by: {$0.value > $1.value})
        }
        
        if rankingArray.count == 1 {
            slot1.text = rankingArray[0].key
            slot1Score.text = "\(rankingArray[0].value)"
        } else if rankingArray.count == 2 {
            slot1.text = rankingArray[0].key
            slot1Score.text = "\(rankingArray[0].value)"
            slot1.text = rankingArray[1].key
            slot1Score.text = "\(rankingArray[1].value)"
        } else if rankingArray.count >= 3 {
            slot1.text = rankingArray[0].key
            slot1Score.text = "\(rankingArray[0].value)"
            slot1.text = rankingArray[1].key
            slot1Score.text = "\(rankingArray[1].value)"
            slot1.text = rankingArray[2].key
            slot1Score.text = "\(rankingArray[2].value)"
        } 
    }
    
    
    @IBAction func resetRank(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "HighScore")
        slot1.text = "N/A"
        slot2.text = "N/A"
        slot3.text = "N/A"
        slot1Score.text = "N/A"
        slot2Score.text = "N/A"
        slot3Score.text = "N/A"
    }
    
   

}
