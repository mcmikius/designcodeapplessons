//
//  ChaptersViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/19/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import RealmSwift

class ChaptersViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        searchController.searchBar.placeholder = "Search for titles, terms and content"
        searchController.obscuresBackgroundDuringPresentation = false
        
        definesPresentationContext = true
        
        searchController.searchBar.sizeToFit()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    var chapterViewController : ChapterViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "Embed Chapter":
            
            let destination = segue.destination as! ChapterViewController
            
            destination.chapter = RealmManager.chapter(withId: "1")
            destination.view.translatesAutoresizingMaskIntoConstraints = false
            
            chapterViewController = destination
            
        default: break
        }
    }
}

extension ChaptersViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { return }
}

extension ChaptersViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        chapterViewController?.searchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
}
