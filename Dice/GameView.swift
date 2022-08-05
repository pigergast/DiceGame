//
//  GameView.swift
//  Dice
//
//  Created by Hieu Le Pham Ngoc on 05/08/2022.
//

import SwiftUI



struct GameView: View {
    
    enum Result{
        case win
        case lose
        case draw
        case waiting
    }
    
    let redDices = ["dice-red-1","dice-red-2","dice-red-3","dice-red-4","dice-red-5","dice-red-6"]
    let blueDices = ["dice-blue-1", "dice-blue-2", "dice-blue-3", "dice-blue-4","dice-blue-5", "dice-blue-6"]
    let possibleResult = ["win", "lose", "draw", "waiting"]
    @State private var dices = [0, 1, 2, 3]
    @State private var result: Result = .waiting
//    init(){
//        self.result = self.possibleResult[3]
//    }
    func rollDices() {
        dices = dices.map({ _ in
                    Int.random(in: 0...redDices.count - 1)
                })
    }
    func checkWin(){
        let redResult = dices[0] + 1 + dices[1] + 1
        let blueResult = dices[2] + 1 + dices[3] + 1
        if(blueResult > redResult){
            result = .win
        }
        else {
            result = .lose
        }
    }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
                Image("rmit-casino-welcome-logo").resizable().scaledToFit().shadow(radius: 7).frame(width: 300)
                VStack{
                    HStack{
                        Spacer()
                        Image(redDices[dices[0]]).resizable().scaledToFit().frame(height: 75)
                        Spacer()
                        Image(redDices[dices[1]]).resizable().scaledToFit().frame(height: 75)
                        Spacer()
                    }
                    Text("🆚").font(.system(size:50))
                    HStack{
                        Spacer()
                        Image(blueDices[dices[2]]).resizable().scaledToFit().frame(height: 75)
                        Spacer()
                        Image(blueDices[dices[2]]).resizable().scaledToFit().frame(height: 75)
                        Spacer()
                    }
                }
                VStack{
                    if(result == .win){
                        Text("😃You win!😃").foregroundColor(.red).frame(height: 100)
                    }
                    else if (result == .lose)
                    {
                        Text("😭You loss!😭").foregroundColor(.red).frame(height: 100)
                    }
                    else {
                    }
                }.frame(height: 150)
                
                Button {
                    self.rollDices()
                    self.checkWin()
                } label: {
                    Capsule().frame(width: 200, height: 75).foregroundColor(.yellow).overlay{
                        Text("Play").foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size:30))
                }

                
                
                
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
