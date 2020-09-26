//
//  RowsOfSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct StudentState {
    let boysNumber: Int
    let girlsNumber: Int
    let totalStudentNumber: Int
    
    init(boysNum: Int, girlsNum: Int, total: Int) {
        self.boysNumber = boysNum
        self.girlsNumber = girlsNum
        self.totalStudentNumber = total
    }   
}





struct RowsOfSeatsView: View {
    let studentState: StudentState
    @State var rows = 6
    @State var columns = 6
    let MaxColumnsNumber = 8
    let MaxRowsNumber = 9
    
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
                        Picker(selection: $columns, label: Text("")) {
                            ForEach(1..<MaxColumnsNumber, id: \.self) { index in
                                Text(String(index))
                            }
                        }
                        .frame(width: 200)
                    }
                    
                    VStack {
                        Text("ヨコ")
                            .font(.title)
                        
                        Picker(selection: $rows, label: Text("")) {
                            ForEach(1..<MaxRowsNumber, id: \.self) { index in
                                Text(String(index))
                            }
                        }
                        .frame(width: 200)
                        .pickerStyle(WheelPickerStyle())
                        .onReceive([self.MaxRowsNumber].publisher.first()) { (value) in }
                        .labelsHidden()
                    }
                }
                
                HStack {
                    Text("タテ：\(columns)列")
                        .font(.title)
                        .padding()
                    Text("ヨコ：\(rows)列")
                        .font(.title)
                        .padding()
                }
                
                Spacer()
                
                if rows * columns < studentState.totalStudentNumber {
                    Text("席の数が足りません")
                        .foregroundColor(.red)
                    Text("次へ")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 140, height: 50)
                        .background(Capsule()
                            .foregroundColor(Color("Button"))
                            .frame(width: 140, height: 50))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    
                } else {
                    VStack{
                        Text("　")
                        NavigationLink(destination: SelectUnusedSeatsView(columnSeats: createSeats(row: rows, column: columns), state: studentState)){
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
                Spacer()
            }
        
        }
        
        
    }
    func createSeats(row: Int, column: Int) -> [ColumnSeats] {
        var columnSeatsArray:[ColumnSeats] = []
        column.times {
            var rowSeats: [Seat] = []
            row.times {
                let rowSeat = Seat()
                rowSeats.append(rowSeat)
            }
            let columnSeat = ColumnSeats(rowSeats: rowSeats)
            columnSeatsArray.append(columnSeat)
        }
        return columnSeatsArray
    }
    
    
}

//struct checkNumberOfPeople: View {
//    var columns: Int
//    var rows: Int
//
//    var body: some View {
//
//        VStack {
//            if columns * rows >
//        }
//
//    }
//}


//pickerを別のViewにすると値が変更されない

//struct PickerView: View {
//    var state:RowsOfSeatsState
//
//    var body: some View {
//        HStack{
//            VStack {
//                Text("タテ")
//                    .font(.title)
//
//                Picker(selection: $state.columns, label: Text("")) {
//                    ForEach(1..<9, id: \.self) { index in
//                        Text(String(index))
//                    }
//                }
//                .frame(width: 200)
//            }
//
//            VStack {
//                Text("ヨコ")
//                    .font(.title)
//
//                Picker(selection: $state.rows, label: Text("")) {
//                    ForEach(1..<9, id: \.self) { index in
//                        Text(String(index))
//                    }
//                }
//                .frame(width: 200)
//            }
//        }
//    }
//}

//struct RowsOfSeats_Previews: PreviewProvider {
//    static var previews: some View {
//        RowsOfSeats()
//
//    }
//}
