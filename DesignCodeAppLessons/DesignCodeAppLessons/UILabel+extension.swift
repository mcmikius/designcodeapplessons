//
//  UILabel+Inspectable.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/23/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    @IBInspectable var shadowOffsetY: CGFloat {
        set { layer.shadowOffset.height = newValue }
        get { return layer.shadowOffset.height }
    }
    
}
