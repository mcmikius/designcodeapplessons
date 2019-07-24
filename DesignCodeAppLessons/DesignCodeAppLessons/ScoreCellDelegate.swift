//
//  ScoreCellDelegate.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

protocol ScoreCellDelegate : class {
    
    func scoreCell(_ cell : ScoreCollectionViewCell, didTapTryAgainExercise exercise : Array<Dictionary<String,Any>>)
    
    func scoreCell(_ cell : ScoreCollectionViewCell, didTapShareExercise exercise : Array<Dictionary<String,Any>>)
}
