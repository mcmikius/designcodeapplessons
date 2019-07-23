//
//  UILabel+extension.swift
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
    @IBInspectable var shadowRadius: CGFloat {
        set { layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }
    @IBInspectable var shadowOpacity: CGFloat {
        set { layer.shadowOpacity = Float(newValue) }
        get { return CGFloat(layer.shadowOpacity) }
    }
}
