//
//  HighViewController.swift
//  AssignmentTwo
//
//  Created by Fisch on 28/4/21.
//

import UIKit

class HighViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var highScore: UITableView!

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
        highScore.dataSource = self
        highScore.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! CustomTableViewCell
        let rank = rankingArray[indexPath.row]
        cell.player.text = rank.key
        cell.score.text = String(rank.value)
        return cell
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
