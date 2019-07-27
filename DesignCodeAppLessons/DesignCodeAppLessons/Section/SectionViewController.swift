//
//  SectionViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/18/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import RealmSwift

class SectionViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var subheadVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var closeVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var coverViewTop: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var section: Section!
    var sections: Results<Section>!
    var indexPath: IndexPath!
    var parts : List<Part> { return section.parts }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        titleLabel.text = section.title
        captionLabel.text = section.caption
        if let url = section.imageURL {
            coverImageView.setImage(from: url)
        }
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

extension SectionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return parts.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let part = parts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Media") as! SectionMediaTableViewCell
        
        cell.configure(with: part)
        
        return cell
    }
}

extension SectionViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        coverViewTop.constant = offsetY < 0 ? 0 : max(-offsetY, -420.0)
    }
}
