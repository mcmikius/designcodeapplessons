//
//  ExerciseTableViewCellDelegate.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

protocol ExerciseTableViewCellDelegate : class {
    
    func exerciseCell(_ cell : ExerciseTableViewCell, receivedAnswer correct : Bool, forQuestion question : Dictionary<String,Any>)
    
    func exerciseCell(_ cell : ExerciseTableViewCell, didReceiveShareFor exercise : Array<Dictionary<String,Any>>, onScoreCell scoreCell : ScoreCollectionViewCell)
}
