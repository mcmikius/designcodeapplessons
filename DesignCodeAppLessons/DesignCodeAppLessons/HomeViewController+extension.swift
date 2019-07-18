//
//  HomeViewController+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/18/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            playVisualEffectView.transform = CGAffineTransform(translationX: 0, y: -offsetY / 3)
            titleLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY / 3)
            deviceImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY / 4)
            backgroundImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY / 5)
        }
    }
}
