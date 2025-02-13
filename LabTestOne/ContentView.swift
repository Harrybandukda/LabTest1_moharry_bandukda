//
//  ContentView.swift
//  LabTestOne
//
//  Created by harry on 25/11/1403 AP.
//

import SwiftUI

struct ContentView: View {
    @State private var primeNum: Int = Int.random(in: 1...100)
    @State private var isCorrect: Bool? = nil
    @State private var correctAns = 0
    @State private var wrongAns = 0
    

    var body: some View {
        VStack {
            Text("\(primeNum)")
            
            HStack {
                Button("Prime") {
                    checkAns(isPrime: true)
                }
                
                Button("Not Prime") {
                    checkAns(isPrime: false)
                }
            }
            
            if let correct = isCorrect {
                Text(correct ? "✅ Correct" : "❌ Wrong")
            }
            Text("Correct: \(correctAns) | Wrong: \(wrongAns)")
        }
    }

    func checkAns(isPrime: Bool) {
        let correctAnswer = isPrimeNumber(primeNum)
        
        if correctAnswer == isPrime {
            correctAns += 1
            isCorrect = true
        } else {
            wrongAns += 1
            isCorrect = false
        }

        nextNum()
    }

    func nextNum() {
        primeNum = Int.random(in: 1...100)
    }

    func isPrimeNumber(_ num: Int) -> Bool {
        if num < 2 { return false }
        for i in 2..<num {
            if num % i == 0 { return false }
        }
        return true
    }
}

#Preview {
    ContentView()
}
		
