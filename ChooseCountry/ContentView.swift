//
//  ContentView.swift
//  Guess The Flag
//
//  Created by KAVIRAJ PANDEY on 17/09/20.
//  Copyright © 2020 KAVIRAJ PANDEY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    enum ActiveAlert {
        case first
        case second
    }
    
    @State private var showingScore = false
    @State private var activeAlert: ActiveAlert = .first
    @State private var scoreTitle = ""
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var ScoreAnswer = 0
     @State private var countries = ["Estonia", "Nigeria", "Poland", "Russia", "Spain", "France", "Germany", "Ireland", "UK", "US"].shuffled()
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors:[ .blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .gray, radius: 1)
                    }
                    
                }
                Text("Your score is: \(ScoreAnswer)")
                    .foregroundColor(.white)
                    .fontWeight(.light)
                Spacer()
            }
        }//zstack closures
            .alert(isPresented: $showingScore) {
                switch activeAlert {
                case .first:
                    return Alert(title: Text("\(scoreTitle)"), message: Text("Your score is \(ScoreAnswer)"), dismissButton: .default(Text("Continue questions")){
                        self.askQuestion()
                        })
                case .second:
                    return Alert(title: Text(""), message: Text("Wrong that's the flag of \(countries[correctAnswer])"), dismissButton: .default(Text("Continue")){
                        self.askQuestion()
                        })
                }
        }
    }//Body closes
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            ScoreAnswer += 1
            activeAlert = .first
            
        } else {
            scoreTitle = "Wrong"
            ScoreAnswer -= 1
            activeAlert = .second
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
