//
//  RowsOfSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct RowsOfSeats: View {
    @State private var columns = 5
    @State private var rows = 5
    @State var isButtonEnable = true
    let numberOfPeople = [1,2,3,4,5,6,7,8]
    
    var body: some View {
        //NavigationView{
            ZStack{
                
                Color(red: 229/255, green: 250/255, blue: 248/255)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("座席の列数を入力")
                        .font(.title)
                    Spacer()
                    
                    HStack{
                        VStack {
                            Text("タテ")
                                .font(.title)
                            
                            Picker(selection: $columns, label: Text("")) {
                                ForEach(0..<numberOfPeople.count) { index in
                                    Text(String(self.numberOfPeople[index])).tag(index)
                                }
                            }.frame(width: 200)
                        }
                        
                        VStack {
                            Text("ヨコ")
                                .font(.title)
                            
                            Picker(selection: $rows, label: Text("")) {
                                ForEach(0..<numberOfPeople.count) { index in
                                    Text(String(self.numberOfPeople[index])).tag(index)
                                }
                            }.frame(width: 200)
                        }
                        
                    }
                    
                    HStack {
                        Text("タテ：\(numberOfPeople[columns])列")
                            .font(.title)
                            .padding()
                        Text("ヨコ：\(numberOfPeople[rows])列")
                            .font(.title)
                            .padding()
                    }
                    
                    Spacer()
                    NavigationLink(destination: SelectUnusedSeats()){
                        Text("次へ")
                    }
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 100, height: 40)
                    .background(Capsule()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 40))
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                    Spacer()

            }
        }
        
    }
    
}
struct RowsOfSeats_Previews: PreviewProvider {
    static var previews: some View {
        RowsOfSeats()
    }
}
