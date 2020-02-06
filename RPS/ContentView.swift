//
//  ContentView.swift
//  RPS
//
//  Created by stl-037 on 04/02/20.
//

import SwiftUI



struct ContentView: View {
    @State var score: Int = 0
    @State var showingResult = false
    var dataArray = ["Rock", "Paper", "Scissors"]
    @State var resultText = ""
    @State var round = 0
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach (dataArray, id: \.self) { item in
                    Button(action: {
                        self.user(selected: item)
                    }) {
                        Text(item)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 80, height: 80, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(30)
                    .padding()
                    .background(Color.yellow)
                    
                    
                }
                
            }
            .alert(isPresented: $showingResult) {
                if round < 10 {
                    return Alert(title: Text(resultText), message: Text("Score: \(score)"), dismissButton: .default(Text("Next Round"), action: {
                        
                    }))
                } else {
                    var result = "Match Draw!"
                    switch self.score {
                    case 1... :
                        result = "You defited Computer!!!"
                    case ...(-1) :
                        result = "Computer crushed you!!!"
                    default:
                        result = "Match Draw!"
                    }
                    return Alert(title: Text(result), message: Text("Score: \(score)"), dismissButton: .default(Text("Restart"), action: {
                        self.round = 0
                        self.score = 0
                    }))
                }
            }
            Spacer()
            Text("Score: \(score)")
        }
    }
    
    func user(selected userSelected: String) {
        let systemSelected = dataArray[Int.random(in: 0...2)]
        var result = 0
        switch (userSelected, systemSelected) {
        case ("Rock", "Scissors"):
            resultText = "Your Rock Crushed Scissors!"
            result = 1
        case ("Scissors","Paper"):
            resultText = "Your Scissors Cut Paper!"
            result = 1
        case ("Paper","Rock"):
            resultText = "Your Paper Covered Rock!"
            result = 1
        case ("Rock", "Paper"):
            resultText = "Your Rock Covered by Paper!"
            result = -1
        case ("Scissors","Rock"):
            resultText = "Your Scissors Crushed by Rock!"
            result = -1
        case("Paper","Scissors"):
            resultText = "Your papers Cut by Scissors!"
            result = -1
        default:
            resultText = "Draw!!!"
            result = 0
        }
        round += 1
        score += result
        showingResult = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
