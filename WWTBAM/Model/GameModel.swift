//
//  GameModel.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 04.04.2022.
//

import Foundation

class Game {
    var gameSession = GameSession()

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
