//
//  HomeViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/17/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var playVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var bookView: UIView!
    @IBOutlet weak var chapterCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    var sections : Array<Section> = CoreDataManager.shared.sections
    var isStatusBarHidden = false
    let presentSectionViewController = PresentSectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        scrollView.delegate = self
        chapterCollectionView.delegate = self
        chapterCollectionView.dataSource = self
        
        titleLabel.alpha = 0
        deviceImageView.alpha = 0
        playVisualEffectView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.titleLabel.alpha = 1
            self.deviceImageView.alpha = 1
            self.playVisualEffectView.alpha = 1
        }
        
//        setStatusBarBackgroundColor(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        isStatusBarHidden = false
        UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "HomeToSection":
            let destinationViewController = segue.destination as! SectionViewController
            let indexPath = sender as! IndexPath
            let section = sections[indexPath.row]
            destinationViewController.section = section
            destinationViewController.sections = sections
            destinationViewController.indexPath = indexPath
            destinationViewController.transitioningDelegate = self
            
            let attributes = chapterCollectionView.layoutAttributesForItem(at: indexPath)!
            let cellFrame = chapterCollectionView.convert(attributes.frame, to: view)
            
            presentSectionViewController.cellFrame = cellFrame
            presentSectionViewController.cellTransform = animateCell(cellFrame: cellFrame)
            
            isStatusBarHidden = true
            UIView.animate(withDuration: 0.5) {
                self.setNeedsStatusBarAppearanceUpdate()
            }
            
        case "Benefits":
            segue.destination.view.translatesAutoresizingMaskIntoConstraints = false
            
        default:
            break
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func playVideo(_ sender: UIButton) {
        let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"
        let url = URL(string: urlString)!
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}

