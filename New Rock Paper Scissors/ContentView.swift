//
//  ContentView.swift
//  New Rock Scissors Paper
//
//  Created by Carlos Román Alcaide on 17/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rockScissorsPaper = ["Rock", "Scissors", "Paper"].shuffled()
    var selectedElement: String {self.rockScissorsPaper[0]}
    var winOrLose = ["How to win against... ",
                   "How to lose against..."]
    @State private var win = true
    @State private var score = 0
    @State private var action = "win"
    @State private var nextRound = false
    @State private var round = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var endgameTitle = ""
    @State private var endgameMessage = ""
    @State private var isGameEnded = false
    
    var body: some View {
        ZStack {
            VStack {
                Section {
                    Text("What will you do to \(action) against...")
                        .font(.headline)
                }

                Section {
                    Text("\(selectedElement)")
                }
                
                Section {
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
                }
            }
            .alert(alertTitle, isPresented: $nextRound) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(alertMessage)
            }
            .alert(endgameTitle, isPresented: $isGameEnded) {
                Button("Restart game", action: askQuestion)
            } message: {
                Text(endgameMessage)
            }
        }
        
    }
    func didIWin(_ number: String) {
        
        if win == true {
            if selectedElement == "Paper" && number == "Scissors" {
                alertTitle = "Correct!"
                alertMessage = "Scissors cut the paper!"
                score += 1
            } else if selectedElement == "Scissors" && number == "Rock" {
                alertTitle = "Correct!"
                alertMessage = "Rock smashes the scissors"
                score += 1
            } else if selectedElement == "Rock" && number == "Paper" {
                alertTitle = "Correct!"
                alertMessage = "Paper wraps around the rock"
                score += 1
            } else {
                alertTitle = "Sorry!"
                alertMessage = "Your answer is not correct"
                score -= 1
            }
        }
        
        if win == false {
            if selectedElement == "Paper" && number == "Scissors" {
                alertTitle = "Sorry!"
                alertMessage = "Paper loses to scissors"
                score -= 1
            } else if selectedElement == "Scissors" && number == "Rock" {
                alertTitle = "Sorry!"
                alertMessage = "Scissors lose to rock"
                score -= 1
            } else if selectedElement == "Rock" && number == "Paper" {
                alertTitle = "Sorry!"
                alertMessage = "Rock loses to paper"
                score -= 1
            } else {
                alertTitle = "Correct!"
                alertMessage = "Right answer"
                score += 1
            }
        }
        
        nextRound = true
        
        if round == 9 {
            isGameEnded = true
            nextRound = true
            if score <= 0 {
                endgameTitle = "You lost!"
                endgameMessage = "But don't worry, you can try again!"
            } else {
                endgameTitle = "Congrats!"
                endgameMessage = "You won the game and your score is \(score)! Wanna play again?"
            }
        }
        
    }
    
    func askQuestion() {
        win.toggle()
        
        round += 1
        
        if win == false {
            action = "lose"
        } else {
            action = "win"
        }
        
        print(round)
        
        rockScissorsPaper = rockScissorsPaper.shuffled()
        
        
    }
    
    func restartGame() {
        if round == 10 {
            isGameEnded = true
            score = 0
            round = 0
        }
    }
}

#Preview {
    ContentView()
}
