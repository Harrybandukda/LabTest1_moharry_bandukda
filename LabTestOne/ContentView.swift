//
//  ContentView.swift
//  LabTestOne
//
//  Created by harry on 25/11/1403 AP.
//

import SwiftUI

struct ContentView: View {
    @State private var number: Int = Int.random(in: 1...100)
    @State private var correctAns = 0
    @State private var wrongAns = 0
    @State private var attempts = 0
    @State private var showAlert = false
    @State private var isCorrect: Bool? = nil
    @State private var timer: Timer? = nil
}

#Preview {
    ContentView()
}
		
