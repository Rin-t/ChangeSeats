//
//  Result.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/24.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI


struct Result: View {
    @EnvironmentObject var shareData: ShareData
    
    @State var boySeats: [Int?] = Array(0...14)
    var body: some View {
        VStack{
            
            //横に作っていった列を縦に指定された段数だけ席を作る。
            ForEach(0..<shareData.columns) { columns in
                HStack {
                    //指定の数だけ横に席を作っていく。
                    ForEach(0..<self.shareData.rows) { rows in
                        
                        Image(systemName: self.boySeats[columns * 5 + rows] == nil ? "xmark.square" : "\(columns * 5 + rows).square")
                            .font(.system(size: 40))
                    }
                    .font(.system(size: 40))
                }
            }
        }.onAppear {
            
            self.boySeats.shuffled()
            
            var count = 0
            for index in 0...self.shareData.usedSeats.count {
                if self.shareData.usedSeats[index + count] == false {
                    count += 1
                    self.boySeats.insert(nil, at: index + count)
                    
                }
                
            }
            print(self.boySeats)
            
            
//            // 男子の人数だけ数字を入力する
//            for index in 0..<self.shareData.boys {
//                self.boySeats[index] = index
//            }
//            // [Optional(0), Optional(1), Optional(2), Optional(3), Optional(4), Optional(5), Optional(6), Optional(7), Optional(8), Optional(9), Optional(10), Optional(11), Optional(12), Optional(13), Optional(14), nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
//            print(self.boySeats)
//
//            self.boySeats.shuffle()
//            // [Optional(5), Optional(13), nil, Optional(10), Optional(11), nil, Optional(9), Optional(6), nil, Optional(4), nil, nil, nil, Optional(7), Optional(2), Optional(8), Optional(3), nil, nil, nil, Optional(14), Optional(12), Optional(1), Optional(0), nil]
//            print(self.boySeats)
        }
    }
}



struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
            .environmentObject(ShareData())
    }
}
