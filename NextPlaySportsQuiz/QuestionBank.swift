//
//  QuestionBank.swift
//  NextPlaySportsQuiz
//
//  Created by Lucas Lopez on 1/28/26.
//

import Foundation

struct QuestionBank {
    static let questions: [Question] = [
        // Soccer
        Question(
            sport: .soccer,
            prompt: "In soccer, what part of your body cannot touch the ball (except the goalkeeper in the box)?",
            options: ["Hands/arms", "Head", "Feet", "Shoulders"],
            correctIndex: 0,
            explanation: "Players can use feet, head, chest, and shoulders, but not hands/arms (goalkeeper is an exception in the penalty area)."
        ),
        Question(
            sport: .soccer,
            prompt: "What happens when the ball fully crosses the sideline?",
            options: ["Throw-in", "Corner kick", "Penalty kick", "Drop ball"],
            correctIndex: 0,
            explanation: "If the ball crosses the sideline, the other team gets a throw-in."
        ),
        Question(
            sport: .soccer,
            prompt: "If the defending team touches the ball last and it crosses their goal line (not a goal), what is awarded?",
            options: ["Goal kick", "Corner kick", "Throw-in", "Free kick"],
            correctIndex: 1,
            explanation: "Last touch by defenders over the goal line (not a goal) = corner kick."
        ),

        // Baseball
        Question(
            sport: .baseball,
            prompt: "How many strikes is an out (in most standard baseball rules)?",
            options: ["2", "3", "4", "5"],
            correctIndex: 1,
            explanation: "Three strikes and the batter is out."
        ),
        Question(
            sport: .baseball,
            prompt: "How many outs end a half-inning?",
            options: ["2", "3", "4", "5"],
            correctIndex: 1,
            explanation: "Three outs end the half-inning and teams switch offense/defense."
        ),
        Question(
            sport: .baseball,
            prompt: "If a batter hits the ball and safely reaches first base, that’s a…",
            options: ["Foul", "Strike", "Single", "Walk-off"],
            correctIndex: 2,
            explanation: "Safely reaching first base on a hit is typically called a single."
        )
    ]
}
