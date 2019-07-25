//
//  BookmarkTableViewCell.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/22/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var chapterNumberLabel: UILabel!
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet var regularContraints: [NSLayoutConstraint]!
    @IBOutlet var accessibilityConstraints: [NSLayoutConstraint]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
                NSLayoutConstraint.deactivate(regularContraints)
                NSLayoutConstraint.activate(accessibilityConstraints)
            } else {
                NSLayoutConstraint.activate(regularContraints)
                NSLayoutConstraint.deactivate(accessibilityConstraints)
            }
        }
    }

}
