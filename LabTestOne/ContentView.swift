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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("\(primeNum)")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .shadow(radius: 10)
                
                HStack(spacing: 40) {
                    Button(action: { checkAns(isPrime: true) }) {
                        Text("Prime")
                            .font(.title2)
                            .padding()
                            .frame(width: 150, height: 60)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 5)
                    }
                    
                    Button(action: { checkAns(isPrime: false) }) {
                        Text("Not Prime")
                            .font(.title2)
                            .padding()
                            .frame(width: 150, height: 60)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 5)
                    }
                }
                
                if let correct = isCorrect {
                    Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(correct ? .green : .red)
                        .transition(.scale)
                }
                
                Text("Correct: \(correctAns) | Wrong: \(wrongAns)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .alert("Finshed!", isPresented: $showAlert){
            Button("play again"){
                playAgain()
            }
        } message: {
            Text("Correct: \(correctAns)\nWrong: \(wrongAns)") // Dialg for result
        }
        .onAppear(perform: startTimer)
    }
    
    // Timer (5 Sec)
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
    
    // play again bytton
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
		
