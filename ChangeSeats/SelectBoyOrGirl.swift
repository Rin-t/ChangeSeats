//
//  SelectBoyOrGirl.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/16.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct SelectBoyOrGirl: View {
    @EnvironmentObject var shareData: ShareData
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Text("男女の座る席を選択")
                    .font(.largeTitle)
                
                Spacer()
                
                HStack {
                    Text("男子：\(shareData.boys)席")
                    Text("女子：\(shareData.girls)席")
                    Text("にしてください。")
                    
                }
                
                VStack {
                    ForEach(0..<shareData.columns) { columns in
                        HStack {
                            ForEach(0..<self.shareData.rows) { rows in
                                
                                Button(action: {
                                    withAnimation { 
                                        let tagNumber = columns * self.shareData.rows + rows
                                        self.shareData.boysSeats[tagNumber].toggle()
                                    }
                                }) {
                                    Image(systemName: self.shareData.usedSeats[(columns * self.shareData.rows) + rows] ? "o.square" : "xmark.square")
                                    .foregroundColor(self.shareData.boysSeats[(columns * self.shareData.rows) + rows] ? .blue : .red)
                                    
                                }
                                .font(.system(size: 40))
                                
                            }
                        }
                    }
                }
                
                HStack{
                    Text("青：男子")
                    Text("赤：女子")
                }
                
                Spacer()
                
                
                NavigationLink(destination: Explanation()){
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
    }
}


struct SelectBoyOrGirl_Previews: PreviewProvider {
    static var previews: some View {
        SelectBoyOrGirl()
            .environmentObject(ShareData())
    }
}


//if shareData.usedSeats[columns * self.shareData.rows + rows] == true {
//    Button(action: {
//        withAnimation {
//            let tagNumber = columns * self.shareData.rows + rows
//            self.shareData.boysSeats[tagNumber].toggle()
//        }
//    }) {
//        Image(systemName: "o.square")
//            .foregroundColor(self.shareData.boysSeats[(columns * self.shareData.rows) + rows] ? .blue : .red)
//            .font(.system(size: 40))
//    }
//
//} else {
//    Image(systemName: "xmark.square")
//        .font(.system(size: 40))
//}
