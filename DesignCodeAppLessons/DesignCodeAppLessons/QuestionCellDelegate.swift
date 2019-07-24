//
//  QuestionCellDelegate.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

protocol QuestionCellDelegate : class {
    func questionCell(_ cell : QuestionCollectionViewCell, didTapAnswerButton button : UIButton, forQuestion question : Dictionary<String,Any>)
}
