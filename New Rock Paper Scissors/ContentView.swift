//
//  ContentView.swift
//  New Rock Scissors Paper
//
//  Created by Carlos Román Alcaide on 17/3/24.
//

import SwiftUI

struct ContentView: View {
    
    var rockScissorsPaper = ["🪨", "✂️", "🗞"].shuffled()
    var selectedElement: String {self.rockScissorsPaper[0]}
    var winLose = ["How to win against... ", "How to lose against..."]
    @State private var isWrong = false
    @State private var isRight = false
    
    
    var body: some View {
        VStack {
            
            
            Text("\(winLose[0])")
                .font(.headline)
            Text("\(selectedElement)")
            
            HStack {
                ForEach(1..<3) { number in
                    Button {
                        //text
                    } label: {
                        Text(rockScissorsPaper[number])
                    }
                }
            }
        }
        
//        func didIWin(_ number: Int) {
//
//
//
//        }
        
    }
}

#Preview {
    ContentView()
}
