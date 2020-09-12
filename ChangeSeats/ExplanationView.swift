//
//  Explanation.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/24.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI



class ExplanationViewModel: ObservableObject {
    @Published var columnSeats: [ColumnSeats]
    @Published var state: StudentState
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        self.columnSeats = columnSeats
        self.state = state
    }
    
    func giveShuffledNumber() {
        let boyNumber = Array(1...state.boysNumber).shuffled()
        let girlNumber = Array(1...state.girlsNumber).shuffled()
        var boyNumberOfArray = 0
        var girlNumberOfArray = 0
        
        for i in 0...columnSeats.count - 1{
            for j in 0...columnSeats[i].rowSeats.count - 1 {
                guard columnSeats[i].rowSeats[j].isOn else {
                    return
                }
                
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


struct ExplanationView: View {
    @ObservedObject var viewModel: ExplanationViewModel

    init(columnSeats: [ColumnSeats], state: StudentState) {
        viewModel = ExplanationViewModel(columnSeats: columnSeats, state: state)
    }
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("さぁ、運命の一瞬です")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                NavigationLink(destination: Result(columnSeats: viewModel.columnSeats, state: viewModel.state)){
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
            self.viewModel.giveShuffledNumber()
        }
    }
}

//struct Explanation_Previews: PreviewProvider {
//    static var previews: some View {
//        Explanation()
//            .environmentObject(ShareData())
//    }
//}
