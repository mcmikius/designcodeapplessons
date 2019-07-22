//
//  UIViewController+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/22/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @IBAction public func unwindToViewController(_ segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}
