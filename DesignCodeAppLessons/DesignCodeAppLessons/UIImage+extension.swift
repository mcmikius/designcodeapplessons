//
//  UIImage+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        view.layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let graphicImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: graphicImage)
    }
}
