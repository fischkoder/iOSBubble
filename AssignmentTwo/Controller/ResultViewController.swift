//
//  ResultViewController.swift
//  AssignmentTwo
//
//  Created by Fisch on 30/4/21.
//

import UIKit

class ResultViewController: UIViewController {
    var historyDictionary:Dictionary = [String:Double]()
    var retrieveUserDefault:Dictionary? = [String:Double]()
    var rankingArray = [(key:String, value:Double)]()

    @IBOutlet weak var resultPlace: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveUserDefault = UserDefaults.standard.dictionary(forKey: "HighScore") as? Dictionary<String, Double>
        if retrieveUserDefault != nil {
            historyDictionary = retrieveUserDefault!
            rankingArray = historyDictionary.sorted(by: {$0.value > $1.value})
        }
        
        var i = 0
        var result:String = ""
        while(i < rankingArray.count){
            result.append("Player:\(rankingArray[i].key) Score:\(rankingArray[i].value)\n")
            i += 1
        }
        
        resultPlace.text = """
                           \(result)
                           """
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func resetResult(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "HighScore")
        resultPlace.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
