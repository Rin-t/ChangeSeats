//
//  NumberOfBGroupView.swift
//  ChangeSeats
//
//  Created by Rin on 2020/09/28.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

class NumberOfBGroupViewModel: ObservableObject {
    @Published var girlsNum: Int = 15
    @Published var boysNum: Int
    
    init(boysNum: Int) {
        self.boysNum = boysNum
    }
}

struct NumberOfBGroupView: View {
    @ObservedObject var viewModel: NumberOfBGroupViewModel
    
    init(boysNum: Int) {
        viewModel = NumberOfBGroupViewModel(boysNum: boysNum)
    }
    
    
    var body: some View {
        
            ZStack{
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("人数を入力")
                        .font(.title)
                 
                    Spacer()
                    VStack{
                        Text("Bグループ：\(viewModel.girlsNum)人")
                            .font(.title)
                        NumberPicker(number: $viewModel.girlsNum)
                    }
                    Text("Aグループ：\(viewModel.boysNum)人")
                        .padding(.bottom, 5)
                    Text("合計：\(viewModel.boysNum + viewModel.girlsNum)人")
                    Spacer()
                    NavigationLink(destination: RowsOfSeatsView(studentState: StudentState(boysNum: self.viewModel.boysNum, girlsNum: self.viewModel.girlsNum, total: self.viewModel.boysNum + self.viewModel.girlsNum))){
                        Text("次へ")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 140, height: 50)
                            .background(Color.blue)
                            .cornerRadius(25)
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    }
                 
                    Spacer()
                }
            }
        
    }
}

//struct NumberOfBGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberOfBGroupView()
//    }
//}
