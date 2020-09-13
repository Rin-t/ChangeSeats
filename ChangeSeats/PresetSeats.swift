//
//  PresetSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/09/12.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct PresetSeats: View {
    @State var columnSeats: [ColumnSeats]
    @State var state: StudentState
    
    var body: some View {
        
        VStack{
            
            ForEach(columnSeats) { column in
                HStack {
                    ForEach(column.rowSeats, id: \.id) { row in
                        Group{
                            if row.isOn{
                                NavigationLink(destination: DetailPresetSeats(num: row.id)){
                                    Image(systemName: "o.square")
                                    .font(.system(size: 40))
                                }
                            } else {
                                Image(systemName: "xmark.square")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                            }
                            
                        }
                        
                    }
                }
                
            }
            
            NavigationLink(destination: Explanation(columnSeats: columnSeats, state: state)){
                Text("次へ")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 140, height: 50)
                    .background(Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 140, height: 50))
                    .overlay(Capsule().stroke(Color.white, lineWidth: 2))
            }
        }
        
    }
    func change(uuid: UUID) {
        for columnIndex in 0..<columnSeats.count {
            for rowIndex in 0..<columnSeats[columnIndex].rowSeats.count {
                if columnSeats[columnIndex].rowSeats[rowIndex].id == uuid {
                    columnSeats[columnIndex].rowSeats[rowIndex].isOn.toggle()
                }
            }
        }
    }
}

//struct PresetSeats_Previews: PreviewProvider {
//    static var previews: some View {
//        PresetSeats()
//    }
//}
