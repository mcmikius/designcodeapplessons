//
//  MKRingProgressView+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit
import MKRingProgressView

extension RingProgressView {
    
    func animateTo(_ number : Int) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        self.progress = Double(number)/100
        CATransaction.commit()
    }
}
