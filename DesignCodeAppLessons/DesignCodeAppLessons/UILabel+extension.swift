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

extension UILabel {
    
    func animateTo(_ number: Int) {
        guard number > 0 else { return }
        let now = DispatchTime.now()
        
        for index in 0...number {
            let milliseconds = 10 * index
            let deadline : DispatchTime = now + .milliseconds(milliseconds)
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                self.text = "\(index)%"
            }
        }
    }
}
