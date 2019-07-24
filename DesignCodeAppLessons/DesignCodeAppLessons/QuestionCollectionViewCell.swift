//
//  QuestionCollectionViewCell.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var question : Dictionary<String,Any>!
    weak var delegate : QuestionCellDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    // MARK: - IBOutlets
    @IBAction func didTapAnswerButton(_ sender: UIButton) {
        sender.setImage(UIImage(named: "Exercises-Check"), for: .normal)
        delegate?.questionCell(self, didTapAnswerButton: sender, forQuestion: question)
    }
}
