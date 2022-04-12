//
//  AddQuestionVC.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 12.04.2022.
//

import UIKit

class AddQuestionVC: UIViewController {
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var rightAnswer: UITextField!
    @IBOutlet weak var answerTwo: UITextField!
    @IBOutlet weak var answerThree: UITextField!
    @IBOutlet weak var answerFour: UITextField!
    @IBOutlet weak var statusOfAdd: UILabel!
    
    private let questionCaretaker = QuestionsCaretaker()
 
    private func checkFields() {
        if questionField.text?.isEmpty != true,
           rightAnswer.text?.isEmpty != true,
           answerTwo.text?.isEmpty != true,
           answerThree.text?.isEmpty != true,
           answerFour.text?.isEmpty != true {
            let newQuestion = [Question(question: questionField.text!,
                                        answer: [rightAnswer.text!,
                                                 answerTwo.text!,
                                                 answerThree.text!,
                                                 answerFour.text!],
                                        trueAnswer: rightAnswer.text!)]
            questions.append(contentsOf: newQuestion)
            self.statusOfAdd.alpha = 1
            self.statusOfAdd.text = "Вопрос добавлен"
            questionCaretaker.save(questions: questions)
            clearAllFields()
            
        } else {
            self.statusOfAdd.alpha = 1
            self.statusOfAdd.text = "Заполните все поля!"
        }
    }
    
    private func clearAllFields() {
        if questionField.text?.isEmpty != true,
           rightAnswer.text?.isEmpty != true,
           answerTwo.text?.isEmpty != true,
           answerThree.text?.isEmpty != true,
           answerFour.text?.isEmpty != true {
            questionField.text = ""
            rightAnswer.text = ""
            answerTwo.text = ""
            answerThree.text = ""
            answerFour.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusOfAdd.alpha = 0
    }
    
    @IBAction func clickAddButton(_ sender: Any) {
        checkFields()
        
    }
    
}
