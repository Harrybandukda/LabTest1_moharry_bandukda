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
    @State private var attempts = 0
    @State private var showAlert = false
    @State private var timer: Timer? = nil
    

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
        .alert("Finshed!", isPresented: $showAlert){
            Button("play again"){
                playAgain()
            }
        } message: {
            Text("Correct: \(correctAns)\nWrong: \(wrongAns)")
        }
        .onAppear(perform: startTimer)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            wrongAns += 1
            nextNum()
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
        attempts += 1
        if attempts >= 10 {
            showAlert = true
        } else {
            nextNum()
        }
    }
    
    func nextNum() {
        primeNum = Int.random(in: 1...100)
    }
    
    func playAgain() {
        correctAns = 0
        wrongAns = 0
        attempts = 0
        nextNum()
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
		
