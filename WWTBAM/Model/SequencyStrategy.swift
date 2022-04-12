//
//  SequencyStratefy.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 07.04.2022.
//

import Foundation

var questionCounter = Observable<Int>(0)


protocol SequencyStrategy {
    func generateQuestionsStrategy() -> Question?
}

final class NormalSequencyStrategy: SequencyStrategy {
    func generateQuestionsStrategy() -> Question? {
        let generatedQuestion = questions[questionCounter.value]
        return generatedQuestion
    }
}

final class RandomlSequencyStrategy: SequencyStrategy {
    func generateQuestionsStrategy() -> Question? {
        let generatedQuestion = questions.randomElement()
        return generatedQuestion
    }
}
