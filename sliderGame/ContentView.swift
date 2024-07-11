//
//  ContentView.swift
//  sliderGame
//
//  Created by Shaheem PP on 11/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var randomRed = Double.random(in: 0...1)
    @State var randomGreen = Double.random(in: 0...1)
    @State var randomBlue = Double.random(in: 0...1)
    
    @State var chosenRed = Double.random(in: 0...1)
    @State var chosenGreen = Double.random(in: 0...1)
    @State var chosenBlue = Double.random(in: 0...1)
    
    
    
    @State var resultMessage = ""
    
    func generateRandomColor() -> (red: Double, green: Double, blue: Double) {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return (red, green, blue)
    }
    
    func checkColors() {
        if abs(chosenRed - randomRed) < 0.01 &&
            abs(chosenGreen - randomGreen) < 0.01 &&
            abs(chosenBlue - randomBlue) < 0.01 {
            resultMessage = "Correct! Colors match."
        } else {
            resultMessage = "Try again! Colors do not match."
        }
    }
    
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .center) {
                    Text("Target")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: randomRed, green: randomGreen, blue: randomBlue))
                }
                VStack(alignment: .center) {
                    Text("Your Choice")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: chosenRed, green: chosenGreen, blue: chosenBlue))
                    VStack(alignment: .leading) {
                        Text("Red: \(Int(chosenRed*255))")
                        Text("Green: \(Int(chosenGreen*255))")
                        Text("Blue: \(Int(chosenBlue*255))")
                    }
                }
            }
            .padding()
            
            HStack{
                Spacer()
                Button("Randomize") {
                    let (newRed, newGreen, newBlue) = generateRandomColor()
                    randomRed = newRed
                    randomGreen = newGreen
                    randomBlue = newBlue
                    print("\n")
                    print("randomRed -> \(randomRed)")
                    print("randomGreen -> \(randomGreen)")
                    print("randomBlue -> \(randomBlue)")
                    print("chosenRed -> \(chosenRed)")
                    print("chosenGreen -> \(chosenGreen)")
                    print("chosenBlue -> \(chosenBlue)")
                    print("\n")
                    resultMessage = ""
                }
                .padding()
                Spacer()
                Button("Submit") {
                    checkColors()
                }
                .padding()
                Spacer()
            }
            .padding()
            
            Slider(value: $chosenRed, in: 0...1, label: {
                Text("Red")
            })
            .tint(.red)
            Slider(value: $chosenGreen, in: 0...1, label: {
                Text("Green")
            })
            .tint(.green)
            Slider(value: $chosenBlue, in: 0...1, label: {
                Text("Blue")
            })
            .tint(.blue)
            
            Text(resultMessage)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
