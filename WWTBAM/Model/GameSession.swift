//
//  GameSession.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 07.04.2022.
//

import Foundation

class GameSession {
    var score = 0
    var totalQuestions = 0
    var correctAnswer: String = ""
}

extension GameSession: GameVCDelegate{
    func didEndGame(withResult result: Int, totalQuestions: Int) {
        print("Result from GameSession \(result) from \(totalQuestions)")
        let resultPercent = Double((result / totalQuestions) * 100)
        print ("Percentage of correct answers \(resultPercent)")
    }
}
