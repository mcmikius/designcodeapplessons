//
//  BookmarksTableViewController.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/22/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import UIKit
import RealmSwift

class BookmarksTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var bookmarks: Results<Bookmark> { return RealmManager.bookmarks }
    var sections: Results<Section> { return RealmManager.sections }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookmarks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell") as! BookmarkTableViewCell
        
        let bookmark = bookmarks[indexPath.row]
        let section = bookmark.section!
        let part = bookmark.part!
        
        cell.chapterTitleLabel.text = section.title.uppercased()
        cell.titleLabel.text = part.title
        cell.bodyLabel.text = part.body
        cell.chapterNumberLabel.text = section.chapterId
        cell.badgeImageView.image = UIImage(named: "Bookmarks/" + "text")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "BookmarksToSection", sender: indexPath)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            let bookmark = self.bookmarks[indexPath.row]
            RealmManager.remove(bookmark)
            
            tableView.deleteRows(at: [indexPath], with: .top)
            tableView.endUpdates()
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookmarksToSection", let sectionViewController = segue.destination as? SectionViewController {
            sectionViewController.section = sections[0]
            sectionViewController.sections = sections
            sectionViewController.indexPath = sender as! IndexPath
        }
    }

}
