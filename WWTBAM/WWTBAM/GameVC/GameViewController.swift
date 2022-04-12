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
    private let recordsCaretaker = RecordsCaretaker()
    
    private var sequencyStrategy: SequencyStrategy {
        switch self.sequency {
        case .normal:
            return NormalSequencyStrategy()
        case .random:
            return RandomlSequencyStrategy()
        }
    }
    
    var GameEnd: ((Int) -> Void)?
    var sequency: Sequency = .normal
    
    weak var gameVCDelegate: GameVCDelegate?
    
    private func fillQuestionsField (question: Question?) {
        guard let question = question else { return }
        self.questionText.text = question.question
        self.answerButtonOne.setTitle(question.answer[0], for: .normal)
        self.answerButtonTwo.setTitle(question.answer[1], for: .normal)
        self.answerButtonThree.setTitle(question.answer[2], for: .normal)
        self.answerButtonFour.setTitle(question.answer[3], for: .normal)
    }
    
    private func generateQuestion() {
        let generatedQuestion = sequencyStrategy.generateQuestionsStrategy()
        fillQuestionsField(question: generatedQuestion)
        guard let generatedQuestion = generatedQuestion else { return }
        game.correctAnswer = generatedQuestion.trueAnswer
        gameSingleton.correctAnswer = game.correctAnswer
        gameSingleton.totalQuestions = questions.count
    }
    
    private func nextQuestionNormal() {
        if questionCounter < questions.count - 1 {
            questionCounter += 1
        } else {
            questionCounter = 0
            performSegue(withIdentifier:"unwindToHome", sender: self)
        }
    }
    
    private func scoreCounter() {
        game.score += 1
        gameSingleton.score = game.score
    }
    
    private func checkAnswer(button: UIButton) {
        if self.game.correctAnswer == button.currentTitle {
            nextQuestionNormal()
            generateQuestion()
            scoreCounter()
        } else {
            questionCounter = 0
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

