//
//  Bubble.swift
//  AssignmentTwo
//
//  Created by Fisch on 24/4/21.
//

import Foundation
import UIKit

class Bubble: UIButton {
    

    var score:Double = 0
    var radius:CGFloat = UIScreen.main.bounds.width / 16
    var groundWidth:CGFloat = UIScreen.main.bounds.width
    var groundHeight:CGFloat = UIScreen.main.bounds.height
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        let xPos = CGFloat.random(in: 10...(groundWidth - 2 * radius))
        let yPos = CGFloat.random(in: 150...(groundHeight - 2 * radius))
        let rectHeigth = 2 * radius
        let rectWidth = 2 * radius
        self.frame = CGRect(x: xPos, y: yPos, width: rectWidth, height: rectHeigth)
        self.layer.cornerRadius = radius
        let possibility = Int.random(in: 1...100)
        switch possibility {
        case 1...40:
            self.score = 1
            self.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        case 41...70:
            self.score = 2
            self.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        case 71...85:
            self.score = 5
            self.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        case 86...95:
            self.score = 8
            self.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        case 96...100:
            self.score = 10
            self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        default:
            print("Something went wrong")
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //CAAnimation
    func animation() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.duration = 0.6
        springAnimation.fromValue = 1
        springAnimation.toValue = 0.8
        springAnimation.repeatCount = 1
        springAnimation.initialVelocity = 0.5
        springAnimation.damping = 1
        
        layer.add(springAnimation, forKey: nil)
    }
    
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
}
