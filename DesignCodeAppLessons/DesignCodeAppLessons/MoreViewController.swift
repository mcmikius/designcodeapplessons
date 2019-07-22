//
//  MoreViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/22/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "MoreToWeb" {
            let navigationController = segue.destination as! UINavigationController
            let webViewController = navigationController.viewControllers.first as! WebViewController
            webViewController.urlString = sender as? String
        }
    }
    

}
