//
//  GameModel.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 04.04.2022.
//

import Foundation

class Game {
    var gameSession = GameSession()
    //    var records: [Record] = []
    private(set) var records: [Record] = [] {
        didSet {
        recordsCaretaker.save(records: self.records)
        }
    }
    private let recordsCaretaker = RecordsCaretaker()
    
    convenience init(gameSession: GameSession) {
        self.init()
        self.gameSession = gameSession
        self.records = self.recordsCaretaker.retrieveRecords()
    }
    public static let shared = Game()
}

class GameSession {
    var score = 0
    var totalQuestions = 0
    var correctAnswer: String = ""
}

extension GameSession: GameVCDelegate{
    func didEndGame(withResult result: Int, totalQuestions: Int) {
        print("Result from GameSession \(result) from \(totalQuestions)")
        let resultPercent = (result / totalQuestions) * 100
        print ("Percentage of correct answers \(resultPercent)")
    }
}
