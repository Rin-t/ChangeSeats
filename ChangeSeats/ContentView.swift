//
//  ContentView.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @EnvironmentObject var shareData: ShareData
    
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
                            
                            Picker(selection: $shareData.boys, label: Text("")) {
                                ForEach(0..<26) { index in
                                    Text(String(index))
                                }
                            }
                            .frame(width: 200)
                        }
                        
                        VStack {
                            Text("女子")
                                .font(.title)
                            
                            Picker(selection: $shareData.girls, label: Text("")) {
                                ForEach(0..<26) { index in
                                    Text(String(index))
                                }
                            }
                            .frame(width: 200)
                        }
                        
                    }
                    
                    HStack {
                        Text("男子：\(shareData.boys)人")
                            .font(.title)
                            .padding()
                        Text("女子：\(shareData.girls)人")
                            .font(.title)
                            .padding()
                    }
                    
                    Text("合計：\(shareData.boys + shareData.girls)人")
                        .font(.title)
                    
                    Spacer()
                    
                    NavigationLink(destination: RowsOfSeats()){
                        Text("次へ")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(width: 120, height: 60)
                            .background(Capsule()
                                .foregroundColor(.blue)
                                .frame(width: 120, height: 60))
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 10)
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
            .environmentObject(ShareData())
    }
}

