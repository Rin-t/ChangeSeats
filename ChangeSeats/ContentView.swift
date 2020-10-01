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
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("人数を入力")
                        .font(.title)
                 
                    Spacer()
                    VStack{
                        Text("Aグループ：\(boysNum)人")
                            .font(.title)
                        NumberPicker(number: $boysNum)
                    }
                    
                    Spacer()
                    NavigationLink(destination: NumberOfBGroupView(boysNum: boysNum)){
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

