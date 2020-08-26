//
//  RowsOfSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct RowsOfSeats: View {
    @EnvironmentObject var shareData:ShareData
    let numberOfRowsOrColumns = Array(1...8)
    
    var body: some View {
        
        ZStack{
            
            Color("background")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("座席の列数を入力")
                    .font(.largeTitle)
                Spacer()
                
                HStack{
                    VStack {
                        Text("タテ")
                            .font(.title)
                        
                        Picker(selection: $shareData.columns, label: Text("")) {
                            ForEach(1..<9, id: \.self) { index in
                                Text(String(index))
                            }
                        }
                        .frame(width: 200)
                    }
                    
                    VStack {
                        Text("ヨコ")
                            .font(.title)
                        
                        Picker(selection: $shareData.rows, label: Text("")) {
                            ForEach(1..<9, id: \.self) { index in
                                Text(String(index))
                            }
                        }
                        .frame(width: 200)
                    }
                    
                }
                
                HStack {
                    Text("タテ：\(shareData.columns)列")
                        .font(.title)
                        .padding()
                    Text("ヨコ：\(shareData.rows)列")
                        .font(.title)
                        .padding()
                }
                
                Spacer()
                NavigationLink(destination: SelectUnusedSeats()){
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
            .navigationBarHidden(false)
        }
        
        
    }
    
    
}
struct RowsOfSeats_Previews: PreviewProvider {
    static var previews: some View {
        RowsOfSeats()
            .environmentObject(ShareData())
    }
}
