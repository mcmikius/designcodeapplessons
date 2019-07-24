//
//  ScoreCollectionViewCell.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import MKRingProgressView

class ScoreCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var percentageLabel : UILabel!
    @IBOutlet var percentageView : RingProgressView!
    
    // MARK: - Properties
    var exercise : Array<Dictionary<String,Any>>!
    weak var delegate : ScoreCellDelegate?
    
    override func awakeFromNib() {
        percentageLabel.animateTo(72)
        percentageView.animateTo(72)
    }
    // MARK: - IBActions
    @IBAction func tryAgainButtonTapped(_ sender: UIButton) {
        delegate?.scoreCell(self, didTapTryAgainExercise: exercise)
    }
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        delegate?.scoreCell(self, didTapShareExercise: exercise)
    }
}
