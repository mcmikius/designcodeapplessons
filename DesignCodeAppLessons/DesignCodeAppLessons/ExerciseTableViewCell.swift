//
//  ExerciseTableViewCell.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var questions: Array<Dictionary<String,Any>>!
    weak var delegate : ExerciseTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
