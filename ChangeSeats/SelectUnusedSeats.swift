//
//  SelectUnusedSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/14.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct SelectUnusedSeats: View {
    @EnvironmentObject var shareData: ShareData
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
    
            VStack{
                Text("使わない席を選択")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                
                ForEach(0..<shareData.columns) { columns in
                    HStack {
                        ForEach(0..<self.shareData.rows) { rows in
                            Button(action: {
                                withAnimation {
                                    let tagNumber = columns * self.shareData.rows + rows
                                    self.shareData.usedSeats[tagNumber].toggle()
                                }
                            }) {
                                Image(systemName: self.shareData.usedSeats[(columns * self.shareData.rows) + rows] ? "o.square" : "xmark.square")
                                    .foregroundColor(.black)
                            }
                            .font(.system(size: 40))
                        }
                    }
                }
                
                Text("前")
                    .font(.title)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .border(Color.black, width: 2)
                    
                HStack{
                    Image(systemName: "o.square")
                    Text("：使用する席")
                        .padding(.trailing, 15)
                    Image(systemName: "xmark.square")
                    Text("：使用しない席")
                }
                
                
                Text("合計人数：\(shareData.boys + shareData.girls)人")
                Text("使用席数：\(countUsedSeats(seatsBool: shareData.usedSeats))席")
                
                Spacer()
                
                NavigationLink(destination: SelectBoyOrGirl()){
                    Text("次へ")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 120, height: 60)
                        .background(Capsule()
                            .foregroundColor(.blue)
                            .frame(width: 120, height: 60))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                        .padding(.bottom,40)
                }
            }
        }
        .onAppear {
            self.shareData.usedSeats = Array(repeating: true, count: self.shareData.rows * self.shareData.columns)
        }
    }
    
    func countUsedSeats(seatsBool:[Bool]) -> Int {
        let numberOfTrue = seatsBool.filter{$0 == true}.count
        return numberOfTrue
    }
}

struct SelectUnusedSeats_Previews: PreviewProvider {
    static var previews: some View {
        SelectUnusedSeats()
        .environmentObject(ShareData())
    }
}
