//
//  QuizViewModel.swift
//  NextPlaySportsQuiz
//
//  Created by Lucas Lopez on 1/28/26.
//

import Foundation
import Combine

@MainActor
final class QuizViewModel: ObservableObject {
    @Published private(set) var questions: [Question]
    @Published private(set) var currentIndex: Int = 0
    @Published var selectedIndex: Int? = nil
    @Published var feedbackText: String? = nil
    @Published private(set) var score: Int = 0

    init() {
        self.questions = QuestionBank.questions.shuffled()
    }

    var currentQuestion: Question {
        questions[currentIndex]
    }

    var progressText: String {
        "\(currentIndex + 1)/\(questions.count)"
    }

    var isAnswered: Bool {
        selectedIndex != nil
    }

    var isLastQuestion: Bool {
        currentIndex == questions.count - 1
    }

    func selectAnswer(_ index: Int) {
        guard selectedIndex == nil else { return } // prevent re-answering
        selectedIndex = index

        let q = currentQuestion
        if index == q.correctIndex {
            score += 1
            feedbackText = "Correct! \(q.explanation)"
        } else {
            feedbackText = "Incorrect! \(q.explanation)"
        }
    }

    func next() {
        guard !isLastQuestion else { return }
        currentIndex += 1
        selectedIndex = nil
        feedbackText = nil
    }

    func restart() {
        questions.shuffle()
        currentIndex = 0
        selectedIndex = nil
        feedbackText = nil
        score = 0
    }
}
