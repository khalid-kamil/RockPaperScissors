//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Khalid Kamil on 24/12/2021.
//

import SwiftUI

struct ContentView: View {
    private var losingMoves = ["🪨", "📃", "✂️"]
    private var winningMoves = ["📃", "✂️", "🪨"]
    @State private var selectedMove = Int.random(in: 0...2)
    @State private var win = Bool.random()
    @State private var score = 0
    @State private var questions = 10
    @State private var finishedGame = false
    
    var body: some View {
        
        ZStack {
            Color.teal
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper, Scissors")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                
                Spacer()
                
                Text(win == true ? "Win this round" : "Lose this round")
                    .font(.title2)
                
                Text(win == true ? losingMoves[selectedMove] : winningMoves[selectedMove])
                    .font(.system(size: 100))
                .padding()
                
                Spacer()
                
                HStack {
                    ForEach(0..<3) { number in
                            Button(losingMoves[number]) {answerTapped(losingMoves[number])}
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                    .padding()
                }
                
                Spacer()
                Text("Score: \(score)")
            }
        }
        .alert("Game Over", isPresented: $finishedGame) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Score: \(score)")
        }
    }
    
    func answerTapped(_ answer: String) {
        if win && answer == winningMoves[selectedMove] {
            score += 1
            print("Correct")
        } else if !win && answer == losingMoves[selectedMove] {
            score += 1
            print("Correct")
        } else {
            score -= 1
            print("Incorrect")
        }
        questions -= 1
        if questions > 0 {
            selectedMove = Int.random(in: 0...2)
            win.toggle()
        } else {
            finishedGame = true
        }
    }
    
    func resetGame() {
        questions = 10
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
