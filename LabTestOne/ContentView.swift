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
        }
    }

    func checkAns(isPrime: Bool) {
        let correctAnswer = isPrimeNumber(primeNum)
        isCorrect = (correctAnswer == isPrime)
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
		
