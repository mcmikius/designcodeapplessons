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

@available(iOS 11.0, *)

fileprivate enum TextStyle: String {
    case body, callout, caption1, caption2, footnote, headline, subheadline, title1, title2, title3, largeTitle
    var textStyle: UIFontTextStyle {
        switch self {
        case .body:
            return .body
        case .callout:
            return .callout
        case .caption1:
            return .caption1
        case .caption2:
            return .caption2
        case .footnote:
            return .footnote
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .title1:
            return .title1
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .largeTitle:
            return .largeTitle
        }
    }
}

@available(iOS 11.0, *)
extension UILabel {
    @IBInspectable var scaledFont: String {
        set (value) {
            guard let style = TextStyle(rawValue: value)?.textStyle else { return }
            let scaledFont = UIFontMetrics(forTextStyle: style).scaledFont(for: font)
            font = scaledFont
            adjustsFontForContentSizeCategory = true
        }
        get {
            return ""
        }
    }
}
