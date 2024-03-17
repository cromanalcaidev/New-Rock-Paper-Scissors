//
//  testy-betsy.swift
//  New Rock Paper Scissors
//
//  Created by Carlos Román Alcaide on 17/3/24.
//

import SwiftUI

struct testy_betsy: View {
    
    var question = "Rock"
    var win = true
    @State private var selectedAnswer = ""
    
    @State private var shouldWin = true
    
    var body: some View {
        
        Text(question)
        
        Button("rock") {
            
        }
        
        Button("paper") {
            checkAnswer(answer: "paper")
        }
        
        Button("scissors") {
            
        }
        
        
    }
    
    func checkAnswer(answer: String) {
        
        if question == "Rock" && win == true {
            print("you did it")
        }
        
    }
    
}

#Preview {
    testy_betsy()
}
