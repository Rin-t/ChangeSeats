//
//  SelectUnusedSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/14.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct Seat: Identifiable, Hashable {
    var id = UUID()
    var isOn = true
    var isBoy = true
    var number:Int?
}

struct ColumnSeats: Identifiable, Hashable {
    var id = UUID()
    var rowSeats: [Seat]
}

class SelectUnusedSeatsViewModel: ObservableObject {
    @Published var columnSeats: [ColumnSeats]
    @Published var state: StudentState
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        self.columnSeats = columnSeats
        self.state = state
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
       
       func countUsedSeats() -> Int {
           var isUsedSeats: Int = 0
           for i in 0...columnSeats.count - 1 {
               for j in 0...columnSeats[i].rowSeats.count - 1 {
                   if columnSeats[i].rowSeats[j].isOn {
                       isUsedSeats += 1
                   }
               }
           }
           return isUsedSeats
       }
}


struct SelectUnusedSeatsView: View {
    //let studentState: StudentState
    //@State var columnSeats: [ColumnSeats]
    @ObservedObject var viewModel: SelectUnusedSeatsViewModel
    
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        viewModel = SelectUnusedSeatsViewModel(columnSeats: columnSeats, state: state)
    }
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("使わない席を選択")
                    .font(.title)
                Spacer()
                ForEach(viewModel.columnSeats) { column in
                    HStack {
                        ForEach(column.rowSeats, id: \.id) { row in
                            Button(action: {
                                self.viewModel.change(uuid: row.id)
                            }){
                                Image(systemName: row.isOn ? "o.square" :  "xmark.square")
                                    .foregroundColor(row.isOn ? .blue : .black)
                                    .font(.system(size: 40))
                            }
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
                
                HStack{
                    Text("合計人数：\(viewModel.state.totalStudentNumber)人")
                        .padding(.trailing, 15)
                    Text("使用席数：\(viewModel.countUsedSeats())席")
                        .padding(.leading, 15)
                }
                .padding(.bottom, 15)
                
                Spacer()
                if viewModel.state.totalStudentNumber == viewModel.countUsedSeats() {
                    VStack{
                        Text("　")
                        NavigationLink(destination: SelectBoyOrGirlView(columnSeats: viewModel.columnSeats, state: viewModel.state)){
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
                } else {
                    Text("席の数と人数が一致していません")
                        .foregroundColor(.red)
                    Text("次へ")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 140, height: 50)
                        .background(Capsule()
                            .foregroundColor(Color("Button"))
                            .frame(width: 140, height: 50))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                }
                Spacer()
            }
        }
    }
    
   
}





//struct SelectUnusedSeats_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectUnusedSeats()
//    }
//}
