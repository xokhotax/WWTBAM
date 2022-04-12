//
//  QuestionCaretaker.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 12.04.2022.
//

import Foundation

typealias Memento = Data

final class QuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    func save(questions: [Question]) { do {
        let data = try self.encoder.encode(questions)
        UserDefaults.standard.set(data, forKey: key) } catch {
            print(error)
        }
    }
    func retrieveRecords() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch { print(error)
            return []
        }
    }
}
