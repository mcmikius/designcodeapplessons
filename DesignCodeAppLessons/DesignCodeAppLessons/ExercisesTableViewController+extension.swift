//
//  ExercisesTableViewController+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension ExercisesTableViewController: ExerciseTableViewCellDelegate {
    
    func exerciseCell(_ cell: ExerciseTableViewCell, receivedAnswer correct: Bool, forQuestion question: Dictionary<String, Any>) {
        performSegue(withIdentifier: "PresentExerciseDialog", sender: nil)
    }
    
    func exerciseCell(_ cell: ExerciseTableViewCell, didReceiveShareFor exercise: Array<Dictionary<String, Any>>, onScoreCell scoreCell: ScoreCollectionViewCell) {
        let message = "🙌 72% in the iOS Design challenge from the Design+Code app by @MengTo"
        let link = URL(string: "https://designcode.io/")!
        guard let image = UIImage(view: scoreCell) else { return }
        let objectsToShare = [message, link, image] as Array<Any>
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activity.excludedActivityTypes = [.airDrop, .addToReadingList, .saveToCameraRoll]
        activity.popoverPresentationController?.sourceView = scoreCell
        present(activity, animated: true)
    }
}
