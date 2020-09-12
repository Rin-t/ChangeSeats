//
//  ContentView.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    //最初にPickerに表示する人数
    @State var boysNum: Int = 15
    @State var girlsNum: Int = 15
    let MaxBoyNumber = 26
    let MaxGirlNumber = 26
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("人数を入力")
                        .font(.largeTitle)
                    Spacer()
                    HStack{
                        VStack {
                            Text("男子")
                                .font(.title)
                            Picker(selection: $boysNum, label: Text("")) {
                                ForEach(0..<MaxBoyNumber) { index in
                                    Text(String(index))
                                }
                            }
                            .frame(width: 200)
                        }
                        VStack {
                            Text("女子")
                                .font(.title)
                            Picker(selection: $girlsNum, label: Text("")) {
                                ForEach(0..<MaxGirlNumber) { index in
                                    Text(String(index))
                                }
                            }
                            .frame(width: 200)
                        }
                    }
                    HStack {
                        Text("男子：\(boysNum)人")
                            .font(.title)
                            .padding()
                        Text("女子：\(girlsNum)人")
                            .font(.title)
                            .padding()
                    }
                    
                    Text("合計：\(boysNum + girlsNum)人")
                        .font(.title)
                    Spacer()
                    NavigationLink(destination: RowsOfSeats(studentState: StudentState(boysNum: boysNum, girlsNum: girlsNum, total: boysNum + girlsNum))){
                        Text("次へ")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 140, height: 50)
                            .background(Capsule()
                                .foregroundColor(.blue)
                                .frame(width: 140, height: 50))
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    }
                    Spacer()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

