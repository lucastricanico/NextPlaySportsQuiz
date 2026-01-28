//
//  ContentView.swift
//  NextPlaySportsQuiz
//
//  Created by Lucas Lopez on 1/28/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = QuizViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            header

            Text(vm.currentQuestion.prompt)
                .font(.title3)
                .fontWeight(.semibold)

            options

            if let feedback = vm.feedbackText {
                Text(feedback)
                    .font(.body)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Spacer()

            footerButtons
        }
        .padding()
    }

    private var header: some View {
        HStack {
            Text(vm.currentQuestion.sport.rawValue)
                .font(.headline)

            Spacer()

            Text(vm.progressText)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var options: some View {
        VStack(spacing: 10) {
            ForEach(Array(vm.currentQuestion.options.enumerated()), id: \.offset) { index, option in
                Button {
                    vm.selectAnswer(index)
                } label: {
                    HStack {
                        Text(option)
                        Spacer()
                    }
                    .padding()
                    .background(optionBackground(for: index))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
                .disabled(vm.isAnswered)
            }
        }
    }

    private func optionBackground(for index: Int) -> some ShapeStyle {
        guard vm.isAnswered else { return AnyShapeStyle(.ultraThinMaterial) }

        let correct = vm.currentQuestion.correctIndex
        if index == correct { return AnyShapeStyle(.green.opacity(0.25)) }
        if index == vm.selectedIndex { return AnyShapeStyle(.red.opacity(0.25)) }
        return AnyShapeStyle(.ultraThinMaterial)
    }

    private var footerButtons: some View {
        HStack(spacing: 12) {
            Text("Score: \(vm.score)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Spacer()

            if vm.isLastQuestion && vm.isAnswered {
                Button("Restart") { vm.restart() }
                    .buttonStyle(.borderedProminent)
            } else {
                Button("Next") { vm.next() }
                    .buttonStyle(.borderedProminent)
                    .disabled(!vm.isAnswered)
            }
        }
    }
}
