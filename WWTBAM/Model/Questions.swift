//
//  Questions.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 03.04.2022.
//

import Foundation

struct Question {
    let question: String
    let answer: [String]
    let trueAnswer: String
}

let questions = [Question(question: "Название реки в Москве",
                          answer: ["Москва", "Обь", "Иртыш", "Волга"],
                          trueAnswer: "Москва"),
                 Question(question: "Кто нес кольцов в Мордор",
                          answer: ["Бильбо", "Фродо", "Голум", "Арагорн"],
                          trueAnswer: "Фродо"),
                 Question(question: "Сколько цветов в радуге",
                          answer: ["14", "7", "1", "5"],
                          trueAnswer: "7"),
                 Question(question: "Сколько мм в 1 метре",
                          answer: ["1000", "100", "25", "49,5"],
                          trueAnswer: "1000"),
                 Question(question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?",
                          answer: ["На гуслях", "На виолончели", "На баяне","На гитаре"],
                          trueAnswer: "На гуслях"),
                 Question(question: "В какой из этих стран один из официальных языков - французский?",
                          answer: ["Республика Гаити","Кения", "Эквадор", "Венесуэла"],
                          trueAnswer: "Республика Гаити"),
                 Question(question: "В каком из этих фильмов не снимался Александр Абдулов?",
                          answer: ["Карнавал", "Московские каникулы", "Чародеи", "Убить дракона"],
                          trueAnswer: "Московские каникулы"),
                 Question(question: "В каком году произошла Куликовская битва?",
                          answer: ["1380","1569","1616","1773"],
                          trueAnswer: "1380"),
                 Question(question: "Кто автор музыки к детской песенке Чунга-Чанга?",
                          answer: [ "Шаинский","Зацепин","Дербенёв","Шпиц"],
                          trueAnswer: "Шаинский")]
