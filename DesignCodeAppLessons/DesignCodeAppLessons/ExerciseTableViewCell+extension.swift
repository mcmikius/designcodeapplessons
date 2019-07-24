//
//  ExerciseTableViewCell+extension.swift
//  DesignCodeAppLessons
//
//  Created by Mykhailo Bondarenko on 7/24/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

extension ExerciseTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return questions.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == questions.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScoreCollectionViewCell", for: indexPath) as! ScoreCollectionViewCell
            cell.exercise = questions
            cell.delegate = self
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as! QuestionCollectionViewCell
        let question = questions[indexPath.row]
        cell.question = question
        cell.delegate = self
        cell.questionLabel.text = question["question"] as? String
        if let possibleAnswers = question["answers"] as? Array<String> {
            for index in 0..<possibleAnswers.count {
                cell.answerButtons[index].setTitle(possibleAnswers[index], for: .normal)
            }
        }
        
        return cell
    }
}

extension ExerciseTableViewCell: QuestionCellDelegate {
    func questionCell(_ cell: QuestionCollectionViewCell, didTapAnswerButton button: UIButton, forQuestion question: Dictionary<String, Any>) {
        let indexPath = collectionView.indexPath(for: cell)!
        let nextIndex = IndexPath(row: indexPath.row + 1, section: indexPath.section)
        if indexPath.row < questions.count {
            collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
        }
        var answerCorrect : Bool = false
        if let correctAnswer = question["correctAnswer"] as? String, let answer = button.titleLabel?.text {
            answerCorrect = correctAnswer == answer
        }
        delegate?.exerciseCell(self, receivedAnswer: answerCorrect, forQuestion: question)
    }
}

extension ExerciseTableViewCell: ScoreCellDelegate {
    func scoreCell(_ cell: ScoreCollectionViewCell, didTapTryAgainExercise exercise: Array<Dictionary<String, Any>>) {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: false)
        collectionView.reloadData()
    }
    
    func scoreCell(_ cell: ScoreCollectionViewCell, didTapShareExercise exercise: Array<Dictionary<String, Any>>) {
        delegate?.exerciseCell(self, didReceiveShareFor: exercise, onScoreCell: cell)
    }
}
