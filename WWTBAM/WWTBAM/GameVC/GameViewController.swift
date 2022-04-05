//
//  GameViewController.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 03.04.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerButtonOne: UIButton!
    @IBOutlet weak var answerButtonTwo: UIButton!
    @IBOutlet weak var answerButtonThree: UIButton!
    @IBOutlet weak var answerButtonFour: UIButton!
    
    private var correctAnswer: String = ""
    private let game = Game.shared.gameSession
    
    private func generateQuestion() {
        let generatedQuestion = questions.randomElement()
        guard let generatedQuestion = generatedQuestion else {return}
        self.questionText.text = generatedQuestion.question
        self.answerButtonOne.setTitle(generatedQuestion.answer[0], for: .normal)
        self.answerButtonTwo.setTitle(generatedQuestion.answer[1], for: .normal)
        self.answerButtonThree.setTitle(generatedQuestion.answer[2], for: .normal)
        self.answerButtonFour.setTitle(generatedQuestion.answer[3], for: .normal)
        game.correctAnswer = generatedQuestion.trueAnswer
        correctAnswer = game.correctAnswer
    }
    
    private func scoreCounter() {
        game.score += 1
        print (game.score)
    }
    
    private func checkAnswer(button: UIButton) {
        if self.correctAnswer == button.currentTitle {
            generateQuestion()
            scoreCounter()
        } else {
            questionText.text = "Неверно"
            performSegue(withIdentifier:"unwindToHome", sender: self)
        }
    }
    
    @IBAction func pushButtonOne(_ sender: Any) {
        checkAnswer(button: answerButtonOne)
    }
    
    @IBAction func pushButtonTwo(_ sender: Any) {
        checkAnswer(button: answerButtonTwo)
    }
    
    @IBAction func pushButtonThree(_ sender: Any) {
        checkAnswer(button: answerButtonThree)
    }
    
    @IBAction func pushButtonFour(_ sender: Any) {
        checkAnswer(button: answerButtonFour)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuestion()
        
    }
    

    
}
