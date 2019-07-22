//
//  PresentSectionViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/22/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class PresentSectionViewController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var cellFrame: CGRect!
    var cellTransform: CATransform3D!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let sectionViewController = transitionContext.viewController(forKey: .to) as! SectionViewController
        let containerView = transitionContext.containerView
        containerView.addSubview(sectionViewController.view)
        
        // Initial state
        let widthConstraint = sectionViewController.scrollView.widthAnchor.constraint(equalToConstant: 304)
        let heightConstraint = sectionViewController.scrollView.heightAnchor.constraint(equalToConstant: 248)
        let bottomConstraint = sectionViewController.scrollView.bottomAnchor.constraint(equalTo: sectionViewController.coverView.bottomAnchor)
        
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, bottomConstraint])
        
        let translate = CATransform3DMakeTranslation(cellFrame.origin.x, cellFrame.origin.y, 0.0)
        let tranform = CATransform3DConcat(translate, cellTransform)
        
        sectionViewController.view.layer.transform = tranform
        sectionViewController.view.layer.zPosition = 999
        
        containerView.layoutIfNeeded()
        
        sectionViewController.scrollView.layer.cornerRadius = 14
        sectionViewController.scrollView.layer.shadowOpacity = 0.25
        sectionViewController.scrollView.layer.shadowOffset.height = 10
        sectionViewController.scrollView.layer.shadowRadius = 20
        
        let moveUpTransform = CGAffineTransform(translationX: 0, y: -100)
        let scaleUpTranform = CGAffineTransform(scaleX: 2, y: 2)
        let removeFromViewTransform = moveUpTransform.concatenating(scaleUpTranform)
        
        sectionViewController.closeVisualEffectView.alpha = 0
        sectionViewController.closeVisualEffectView.transform = removeFromViewTransform
        
        sectionViewController.subheadVisualEffectView.alpha = 0
        sectionViewController.subheadVisualEffectView.transform = removeFromViewTransform
        
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.7) {
            
            // Final state
            NSLayoutConstraint.deactivate([widthConstraint, heightConstraint, bottomConstraint])
            sectionViewController.view.layer.transform = CATransform3DIdentity
            containerView.layoutIfNeeded()
            
            sectionViewController.scrollView.layer.cornerRadius = 0
            
            sectionViewController.closeVisualEffectView.alpha = 1
            sectionViewController.closeVisualEffectView.transform = .identity
            
            sectionViewController.subheadVisualEffectView.alpha = 1
            sectionViewController.subheadVisualEffectView.transform = .identity
            
            let scaleTranform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            let moveTransform = CGAffineTransform(translationX: 30, y: 10)
            let titleTranform = scaleTranform.concatenating(moveTransform)
            
            sectionViewController.titleLabel.transform = titleTranform
        }
        
        animator.addCompletion { (finished) in
            
            // Completion
            transitionContext.completeTransition(true)
        }
        
        animator.startAnimation()
    }
}
