//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Vitali Kupratsevich on 11.02.25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        if !quizBrain.quiz.isEmpty {
            updateUI()
        }
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard !quizBrain.quiz.isEmpty else { return }
        
        let isCorrectAnsweer = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        sender.backgroundColor = isCorrectAnsweer ? UIColor.green : UIColor.red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.nextQuestion()
        }
    }
    
    func nextQuestion() {
        quizBrain.incrementQuestionNumber()
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.setQuestionText()
        progressBar.setProgress(quizBrain.setProgress(), animated: true)
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}
