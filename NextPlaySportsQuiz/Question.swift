//
//  Question.swift
//  NextPlaySportsQuiz
//
//  Created by Lucas Lopez on 1/28/26.
//

import Foundation

struct Question: Identifiable, Equatable {
    let id = UUID()
    let sport: Sport
    let prompt: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

enum Sport: String, CaseIterable {
    case soccer = "Soccer"
    case baseball = "Baseball"
}
