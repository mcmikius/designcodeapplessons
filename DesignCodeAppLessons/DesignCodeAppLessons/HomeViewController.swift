//
//  HomeViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/17/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import AVKit
import RealmSwift

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var playVisualEffectView: UIVisualEffectView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var bookView: UIView!
    
    // MARK: - Properties
    
    var isStatusBarHidden = false
    let presentSectionViewController = PresentSectionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        scrollView.delegate = self
        
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
        case "Embed Chapter":
            
            let destination = segue.destination as! ChapterViewController
            
            destination.chapter = RealmManager.chapter(withId: "1")
            destination.view.translatesAutoresizingMaskIntoConstraints = false
        case "HomeToSection":
            let destination = segue.destination as! SectionViewController
            let section = sender as! Section
            destination.section = section
            destination.transitioningDelegate = self
            
            isStatusBarHidden = true
            UIView.animate(withDuration: 0.5, animations: {
                self.setNeedsStatusBarAppearanceUpdate()
            })
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
    @IBAction func navigationBarBuyButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "Home to Purchase", sender: nil)
    }
}

