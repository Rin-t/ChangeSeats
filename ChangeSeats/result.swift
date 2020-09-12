//
//  Result.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/24.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct Result: View {
    @State var columnSeats: [ColumnSeats]
    @State var state: StudentState
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("抽選結果")
                    .font(.largeTitle)
                Spacer()
                ForEach(columnSeats) { column in
                    HStack {
                        ForEach(column.rowSeats, id: \.id) { row in
                            Group{
                                if row.isOn {
                                    if row.isBoy{
                                        Image(systemName: "\(row.number!).square")
                                            .foregroundColor(.blue)
                                    } else {
                                        Image(systemName: "\(row.number!).square")
                                            .foregroundColor(.red)
                                    }
                                } else {
                                    Image(systemName: "xmark.square")
                                }
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
                Spacer()
            }
        }
    }
}



//struct Result_Previews: PreviewProvider {
//    static var previews: some View {
//        Result()
//            .environmentObject(ShareData())
//    }
//}
