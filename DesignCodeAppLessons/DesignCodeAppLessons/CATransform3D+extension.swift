//
//  CATransform3D+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/25/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import QuartzCore

fileprivate let perspective: CGFloat = -1.0 / 2500

func CATransform3DMakeRotationWithPerspective(_ angle : CGFloat, _ x : CGFloat, _ y : CGFloat, _ z : CGFloat) -> CATransform3D {
    var transform = CATransform3DMakeRotation(angle, x, y, z)
    transform.m34 = perspective
    return transform
}

func CATransform3DMakeTranslationWithPerspective(_ x: CGFloat, _ y : CGFloat, _ z: CGFloat) -> CATransform3D {
    var transform = CATransform3DMakeTranslation(x, y, z)
    transform.m34 = perspective
    return transform
}
