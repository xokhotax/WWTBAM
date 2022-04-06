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
    private var game = GameSession()
    private let gameSingleton = Game.shared.gameSession
    private var questionCounter = 0
    private let recordsCaretaker = RecordsCaretaker()
    
    var GameEnd: ((Int) -> Void)?
    
    weak var gameVCDelegate: GameVCDelegate?
    
    
    private func generateQuestion() {
        
        if questionCounter < questions.count - 1 {
            let generatedQuestion = questions[questionCounter]
            self.questionText.text = generatedQuestion.question
            self.answerButtonOne.setTitle(generatedQuestion.answer[0], for: .normal)
            self.answerButtonTwo.setTitle(generatedQuestion.answer[1], for: .normal)
            self.answerButtonThree.setTitle(generatedQuestion.answer[2], for: .normal)
            self.answerButtonFour.setTitle(generatedQuestion.answer[3], for: .normal)
            game.correctAnswer = generatedQuestion.trueAnswer
            gameSingleton.correctAnswer = game.correctAnswer
            gameSingleton.totalQuestions = questions.count
            questionCounter += 1
        } else {
            performSegue(withIdentifier:"unwindToHome", sender: self)
        }
    }
    
    private func scoreCounter() {
        game.score += 1
        gameSingleton.score = game.score
    }
    
    private func checkAnswer(button: UIButton) {
        if self.game.correctAnswer == button.currentTitle {
            generateQuestion()
            scoreCounter()
        } else {
            questionText.text = "Неверно"
            GameEnd?(game.score)
            performSegue(withIdentifier:"unwindToHome", sender: self)
            self.game.didEndGame(withResult: game.score,
                                 totalQuestions: questions.count)
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

