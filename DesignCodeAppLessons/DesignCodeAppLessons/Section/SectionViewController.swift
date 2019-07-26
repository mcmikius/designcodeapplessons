//
//  SectionViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/18/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class SectionViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var subheadVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var closeVisualEffectView: UIVisualEffectView!
    
    // MARK: - Properties
    
    var section : Section!
    var sections: Array<Section>!
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        titleLabel.text = section.title
        captionLabel.text = section.caption
        bodyLabel.text = section.body
        coverImageView.image = UIImage(named: section.imageName!)
        progressLabel.text = "\(indexPath.row+1) / \(sections.count)"
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - IBActions
    
    
}
