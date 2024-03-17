//
//  ContentView.swift
//  New Rock Scissors Paper
//
//  Created by Carlos Román Alcaide on 17/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rockScissorsPaper = ["rock", "scissors", "paper"].shuffled()
    var selectedElement: String {self.rockScissorsPaper[0]}
    var winOrLose = ["How to win against... ",
                   "How to lose against..."]
    @State private var win = true
    @State private var score = 0
    @State private var action = "win"
    @State private var showingScore = false
//    @State private var choice = ""
//    @State private var isWrong = false
//    @State private var isRight = false
    
    var body: some View {
        VStack {
            
            
            Text("What will you do to \(action) against...")
                .font(.headline)
            Text("\(selectedElement)")
            
            HStack {
                Spacer()
                ForEach(1..<3) { number in
                    Spacer()
                    Button {
                        didIWin(rockScissorsPaper[number])
                    } label: {
                        Text(rockScissorsPaper[number])
                    }
                    Spacer()
                }
                Spacer()
            }
            Text("Your score is \(score)")
        }
        .alert("", isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    func didIWin(_ number: String) {
        
        if win == true {
            if selectedElement == "paper" && number == "scissors" {
                print("scissors cut the paper!")
                score += 1
            } else if selectedElement == "scissors" && number == "rock" {
                print("rock smashes the scissors")
                score += 1
            } else if selectedElement == "rock" && number == "paper" {
                print("paper wraps around the rock")
                score += 1
            } else {
                print("Wrong answer!")
                score -= 1
            }
        }
        
        if win == false {
            if selectedElement == "paper" && number == "scissors" {
                print("paper loses to scissors")
                score -= 1
            } else if selectedElement == "scissors" && number == "rock" {
                print("scissors lose to rock")
                score -= 1
            } else if selectedElement == "rock" && number == "paper" {
                print("rock loses to paper")
                score -= 1
            } else {
                print("right answer")
                score += 1
            }
        }
        
        showingScore = true
        
    }
    
    func askQuestion() {
        win.toggle()
        
        if win == false {
            action = "lose"
        } else {
            action = "win"
        }

        rockScissorsPaper = rockScissorsPaper.shuffled()
        
        
    }
}

#Preview {
    ContentView()
}
