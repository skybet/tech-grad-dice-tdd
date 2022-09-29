//
//  ViewController.swift
//  tdd_tech_grad_dice
//
//  Created by Matthew Glover on 29/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceOneImageView: UIImageView!
    @IBOutlet weak var diceTwoImageView: UIImageView!
    @IBOutlet weak var diceThreeImageView: UIImageView!
    @IBOutlet weak var diceFourImageView: UIImageView!
    @IBOutlet weak var diceFiveImageView: UIImageView!
    
    var currentDiceRoll: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollDiceButtonTapped(_ sender: Any) {
        
        currentDiceRoll.removeAll()
        for _ in 0...4 {
            currentDiceRoll.append(Int.random(in: 1...6))
        }
        
        diceOneImageView.image = UIImage(named: "\(currentDiceRoll[0])")
        diceTwoImageView.image = UIImage(named: "\(currentDiceRoll[1])")
        diceThreeImageView.image = UIImage(named: "\(currentDiceRoll[2])")
        diceFourImageView.image = UIImage(named: "\(currentDiceRoll[3])")
        diceFiveImageView.image = UIImage(named: "\(currentDiceRoll[4])")
    }
}

