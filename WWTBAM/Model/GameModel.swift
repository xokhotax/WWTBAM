//
//  GameModel.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 04.04.2022.
//

import Foundation

class Game {
    var gameSession = GameSession()
    
    convenience init(gameSession: GameSession) {
        self.init()
        self.gameSession = gameSession
    }
    
    public static let shared = Game()
}

class GameSession {
    var score = 0
    var totalQuestions = 0
    var correctAnswer: String = ""
}
