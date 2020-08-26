//
//  Result.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/24.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

//やりたいこと
//①男子の人数分の数字をランダムに配列に入れる
//②誰かが座っているとき(shareData.usedSeats == true)のとき①で作った配列の
//数字の図を当てはめていきたい


struct Result: View {
    @EnvironmentObject var shareData: ShareData
    
    //男子の人数分の番号をシャッフルして配列に入れたい↓だとできない
    var boyShuffleNumber = Array(1...ShareData.boys).shuffled()
    
    var body: some View {
        VStack{
            
            //横に作っていった列を縦に指定された段数だけ席を作る。
            ForEach(0..<shareData.columns) { columns in
                HStack {
                    
                    //指定の数だけ横に席を作っていく。
                    ForEach(0..<self.shareData.rows) { rows in
                        
                        //shareData.usedSeat == true → 誰かが座っている
                        //すべての席にcolumns * self.shareData.rows + rowsで番号を振り、Boolの配列で管理
                        if self.shareData.usedSeats[columns * self.shareData.rows + rows] == true {
                            
                        //誰かが座っている席ならboyShuffleNumberの番号の図を表示する
                            Image(systemName: "\(boyShuffleNumber[0]).square")
                           
                        
                        } else {
                        //誰も座っていないならxの図を出す。
                            Image(systemName: "xmark.square")
                        }
                    }
                    .font(.system(size: 40))
                }
            }
        }
    }
}



struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
            .environmentObject(ShareData())
    }
}
