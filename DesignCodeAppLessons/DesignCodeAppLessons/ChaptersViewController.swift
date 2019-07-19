//
//  ChaptersViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/19/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var chapterOneCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        chapterOneCollectionView.delegate = self
        chapterOneCollectionView.dataSource = self
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
