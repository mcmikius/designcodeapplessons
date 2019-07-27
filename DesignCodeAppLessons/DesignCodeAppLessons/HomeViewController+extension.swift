//
//  HomeViewController+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/18/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return presentSectionViewController
    }
}

extension HomeViewController : ChapterCollectionDelegate {
    
    func didTap(cell: SectionCollectionViewCell, on collectionView: UICollectionView, for section: Section, with transform: CATransform3D) {
        
        let indexPath = collectionView.indexPath(for: cell)!
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
        let frame = collectionView.convert(attributes.frame, to: view)
        presentSectionViewController.cellFrame = frame
        presentSectionViewController.cellTransform = transform
        
        performSegue(withIdentifier: "HomeToSection", sender: section)
    }
}

extension HomeViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            playVisualEffectView.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            titleLabel.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            deviceImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/4)
            backgroundImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/5)
        }
        
        let navigationIsHidden = offsetY <= 0
        navigationController?.setNavigationBarHidden(navigationIsHidden, animated: true)
    }
}
