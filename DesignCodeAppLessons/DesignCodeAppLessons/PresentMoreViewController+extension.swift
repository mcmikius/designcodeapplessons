//
//  PresentMoreViewController+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/25/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension PresentMoreViewController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: .to) as! MoreViewController
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toVC.view)
        
        let degrees : CGFloat = -100.0
        let angle = degrees * .pi / 180.0
        let rotation = CATransform3DMakeRotationWithPerspective(angle, 0, 1, 0)
        let translation = CATransform3DMakeTranslationWithPerspective(80, 200, 0)
        
        let dialogView = toVC.dialogView!
        
        dialogView.layer.transform = CATransform3DConcat(rotation, translation)
        dialogView.alpha = 0
        
        let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.7) {
            
            dialogView.layer.transform = CATransform3DIdentity
            dialogView.alpha = 1
        }
        animator.startAnimation()
        
        let fromVC = transitionContext.viewController(forKey: .from)!
        
        animator.addCompletion { (finished) in
            
            if let snapshot = fromVC.view.snapshotView(afterScreenUpdates: true) {
                containerView.insertSubview(snapshot, at: 0)
                
                snapshot.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    snapshot.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                    snapshot.topAnchor.constraint(equalTo: containerView.topAnchor),
                    snapshot.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                    snapshot.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                    ])
            }
            
            transitionContext.completeTransition(true)
        }
    }
}



