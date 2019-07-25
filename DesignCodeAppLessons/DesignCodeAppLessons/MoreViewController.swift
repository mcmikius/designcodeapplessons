//
//  MoreViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/22/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import MKRingProgressView

class MoreViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var oneProgressView: RingProgressView!
    @IBOutlet weak var twoProgressView: RingProgressView!
    @IBOutlet weak var threeProgressView: RingProgressView!
    @IBOutlet weak var oneProgressLabel: UILabel!
    @IBOutlet weak var twoProgressLabel: UILabel!
    @IBOutlet weak var threeProgressLabel: UILabel!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet var panToClose: InteractionPanToClose!
    
    
    weak var previousViewController: UIViewController?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let progresses = [72,56,22]
        
        oneProgressLabel.animateTo(progresses[0])
        twoProgressLabel.animateTo(progresses[1])
        threeProgressLabel.animateTo(progresses[2])
        
        oneProgressView.animateTo(progresses[0])
        twoProgressView.animateTo(progresses[1])
        threeProgressView.animateTo(progresses[2])
    }
    
    // MARK: - IBActions
    
    @IBAction func showSafari(_ sender: UIButton) {
        performSegue(withIdentifier: "MoreToWeb", sender: "https://designcode.io")
    }
    @IBAction func showCommunity(_ sender: UIButton) {
        performSegue(withIdentifier: "MoreToWeb", sender: "https://spectrum.chat/design-code")
    }
    @IBAction func showTwitter(_ sender: UIButton) {
        performSegue(withIdentifier: "MoreToWeb", sender: "https://twitter.com/mengto")
    }
    @IBAction func sendEmail(_ sender: UIButton) {
        let email = "meng@designcode.io"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func tappedOutsideDialog(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            
            self.panToClose.rotateDialogOut()
            
        }) { (finished) in
            
            self.tabBarController?.selectedViewController = self.previousViewController
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "MoreToWeb" {
            let navigationController = segue.destination as! UINavigationController
            let webViewController = navigationController.viewControllers.first as! WebViewController
            webViewController.urlString = sender as? String
        }
    }
    

}
