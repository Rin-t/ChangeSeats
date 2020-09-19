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
    let MAZ_BOY_NUMBER = 26
    let MAX_GIRL_NUMBER = 26
    
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
                        
                        
//                        VStack {
//                            Text("男子")
//                                .font(.title)
//                            Picker(selection: $boysNum, label: Text("")) {
//                                ForEach(0..<MAZ_BOY_NUMBER) { index in
//                                    Text(String(index))
//                                }
//                            }
//                            .frame(width: 200)
//                        }
                        
                        NumberPicker(title: "男子", number: $boysNum)
                        
                        
//                        VStack {
//                            Text("女子")
//                                .font(.title)
//                            Picker(selection: $girlsNum, label: Text("")) {
//                                ForEach(0..<MAX_GIRL_NUMBER) { index in
//                                    Text(String(index))
//                                }
//                            }
//                            .frame(width: 200)
//                        }
                        
                        NumberPicker(title: "女子", number: $girlsNum)

                        
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
                            .background(Color.blue)
                            .cornerRadius(25)
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

