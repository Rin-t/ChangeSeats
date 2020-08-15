//
//  ContentView.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State private var boys = 14
    @State private var girls = 14
    @State var isButtonEnable = true
    let numberOfPeople = Array(1...25)
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("人数を入力")
                        .font(.title)
                    
                    Spacer()
                    
                    HStack{
                        VStack {
                            Text("男子")
                                .font(.title)
                            
                            Picker(selection: $boys, label: Text("")) {
                                ForEach(0..<numberOfPeople.count) { index in
                                    Text(String(self.numberOfPeople[index])).tag(index)
                                }
                            }.frame(width: 200)
                        }
                        
                        VStack {
                            Text("女子")
                                .font(.title)
                            
                            Picker(selection: $girls, label: Text("")) {
                                ForEach(0..<numberOfPeople.count) { index in
                                    Text(String(self.numberOfPeople[index])).tag(index)
                                }
                            }.frame(width: 200)
                        }
                        
                    }
                    
                    HStack {
                        Text("男子：\(numberOfPeople[boys])人")
                            .font(.title)
                            .padding()
                        Text("女子：\(numberOfPeople[girls])人")
                            .font(.title)
                            .padding()
                    }
                    
                    Text(total(boy:numberOfPeople[boys] , girl:numberOfPeople[girls]))
                        .font(.title)
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: RowsOfSeats()){
                        Text("次へ")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 100, height: 40)
                            .background(Capsule()
                                .foregroundColor(.blue)
                                .frame(width: 100, height: 40))
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 10)
                    }
                    
                    Spacer()
                }
                
            }
            .navigationBarTitle("Title")
            .navigationBarHidden(true)
            
        }
        
        
    }
    
    func total (boy:Int, girl:Int) -> String {
        let result = String(boy + girl)
        return "合計：" + result + "人"
    }
    
    func checkNumberOfPeople(boy:Int, girl:Int) -> Bool {
        let result = boy + girl
        return 40 >= result
    }
    
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
