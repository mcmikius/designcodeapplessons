//
//  TestimonialViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/18/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {
    

    // MARK: - IBOutlets
    @IBOutlet weak var testimonialCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testimonialCollectionView.delegate = self
        testimonialCollectionView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
