//
//  ViewController.swift
//  Quizzler-iOS
//
//  Created by Vitali on 2025.
//

import UIKit

struct Question {
    let question: String
    let answer: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questionNumber = 0
    let quiz: [Question] = [
        Question(question: "Four + Two is equal to six.", answer: "True"),
        Question(question: "Five - Three is greater than One", answer: "True"),
        Question(question: "Three + Eight is less than Ten", answer: "False")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !quiz.isEmpty {
            updateUI()
        }
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard !quiz.isEmpty else { return }
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        
        print(userAnswer == actualAnswer ? "Correct!" : "Wrong!")
        
        nextQuestion()
    }
    
    func nextQuestion() {
        questionNumber = (questionNumber + 1) % quiz.count
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].question
        progressBar.setProgress(Float(questionNumber + 1) / Float(quiz.count), animated: true)
    }
}
