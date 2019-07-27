//
//  UIImage+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

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

extension UIImageView {
    
    @discardableResult
    func setImage(from url: URL, with placeholder: UIImage? = nil, completion: CompletionHandler? = nil) -> RetrieveImageTask? {
        
        ImageCache.default.retrieveImage(forKey: url.absoluteString, options: [], completionHandler: {
            image, _ in
            self.image = image
        })
        
        return kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [KingfisherOptionsInfoItem.transition(ImageTransition.fade(0.2))],
            progressBlock: nil,
            completionHandler: completion)
    }
}
