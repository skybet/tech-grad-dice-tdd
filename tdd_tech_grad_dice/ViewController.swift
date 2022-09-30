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
    
    @IBOutlet weak var solutionsStackView: UIStackView!
    var currentDiceRoll: [Int] = []
    
    var yatzheeSolutionsCalculator: YahtzeeSolutionCalculator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.yatzheeSolutionsCalculator = YahtzeeSolutionCalculator()
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
        
        updateAvailableSolutions()
    }
    
    private func updateAvailableSolutions() {
        
        clearSolutionsStackView()
        let availableSolutions = yatzheeSolutionsCalculator.availableSolutions(for: currentDiceRoll)
        
        for availableSolution in availableSolutions {
            let solutionLabel = AvailableSolutionLabel(frame: .zero, solution: availableSolution)
            solutionLabel.translatesAutoresizingMaskIntoConstraints = false
            solutionsStackView.addArrangedSubview(solutionLabel)
            
            NSLayoutConstraint.activate([
                solutionsStackView.widthAnchor.constraint(equalTo: solutionsStackView.widthAnchor)
            ])
        }
    }
    
    private func clearSolutionsStackView() {
        for arrangedSubview in solutionsStackView.arrangedSubviews {
            solutionsStackView.removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
    }
}

