//
//  Explanation.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/24.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct Explanation: View {
    @State var columnSeats: [ColumnSeats]
    @State var state: StudentState
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("さぁ、運命の一瞬です")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                NavigationLink(destination: Result(columnSeats: columnSeats, state: state)){
                    Text("Let's 抽選")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 180, height: 60, alignment: .center)
                        .background(Capsule()
                            .foregroundColor(.blue)
                            .frame(width: 180, height: 60))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                }
            }
 
        }.onAppear{
            self.giveShuffledNumber(columnSeats: self.columnSeats, state: self.state)
        }
        
    }
    
    func giveShuffledNumber(columnSeats: [ColumnSeats], state: StudentState) {
        let boyNumber = Array(1...state.boysNumber).shuffled()
        let girlNumber = Array(1...state.girlsNumber).shuffled()
        var boyNumberOfArray = 0
        var girlNumberOfArray = 0
    
        for i in 0...columnSeats.count - 1{
            for j in 0...columnSeats[i].rowSeats.count - 1 {
                if columnSeats[i].rowSeats[j].isOn {
                    if columnSeats[i].rowSeats[j].isBoy {
                        self.columnSeats[i].rowSeats[j].number = boyNumber[boyNumberOfArray]
                        boyNumberOfArray += 1
                    } else {
                        self.columnSeats[i].rowSeats[j].number = girlNumber[girlNumberOfArray]
                        girlNumberOfArray += 1
                    }
                }
            }
        }
    }
}

//struct Explanation_Previews: PreviewProvider {
//    static var previews: some View {
//        Explanation()
//            .environmentObject(ShareData())
//    }
//}
