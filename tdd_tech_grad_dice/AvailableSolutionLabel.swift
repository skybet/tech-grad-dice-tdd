//
//  AvailableSolutionLabel.swift
//  tdd_tech_grad_dice
//
//  Created by Matthew Glover on 29/09/2022.
//

import UIKit

class AvailableSolutionLabel: UIView {

    private var type: String = ""
    private var score: Int = 0
    
    private var typeLabel: UILabel!
    private var scoreLabel: UILabel!

    convenience init(frame: CGRect, solution: Solution) {
        self.init(frame: frame)
        self.type = solution.type
        self.score = solution.score
        
        setupLabels()
    }
    
    private func setupLabels() {
        typeLabel = UILabel(frame: .zero)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.textAlignment = .left
        typeLabel.text = self.type
        typeLabel.font = .preferredFont(forTextStyle: .title2)
        addSubview(typeLabel)
        
        scoreLabel = UILabel(frame: .zero)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "\(self.score)"
        scoreLabel.font = .preferredFont(forTextStyle: .headline)
        addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            typeLabel.topAnchor.constraint(equalTo: topAnchor),
            typeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            typeLabel.widthAnchor.constraint(equalToConstant: 250.0),
            
            scoreLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: typeLabel.centerYAnchor),
            
            heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
}
