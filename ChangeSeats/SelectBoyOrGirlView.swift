//
//  SelectBoyOrGirl.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/16.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

enum SeatStatus {
    case nonUse
    case use
    case boyUse
    case girlUse
}

struct isBoyStatus: Identifiable, Hashable {
    var id = UUID()
    var isBoy: Bool = true
}

class SelectBoyOrGirlViewModel: ObservableObject {
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
                       columnSeats[columnIndex].rowSeats[rowIndex].isBoy.toggle()
                   }
               }
           }
       }
       
       func countBoySeats() -> Int {
           var boySeats: Int = 0
           for i in 0...columnSeats.count - 1 {
               for j in 0...columnSeats[i].rowSeats.count - 1{
                   if columnSeats[i].rowSeats[j].isOn {
                       if columnSeats[i].rowSeats[j].isBoy {
                           boySeats += 1
                       }
                   }
               }
           }
        return boySeats
       }
    
       func countgirlSeats() -> Int{
           var girlSeats: Int = 0
           for i in 0...columnSeats.count - 1 {
               for j in 0...columnSeats[i].rowSeats.count - 1{
                   if columnSeats[i].rowSeats[j].isBoy == false {
                       girlSeats += 1
                   }
               }
           }
        return girlSeats
       }
}


struct SelectBoyOrGirlView: View {
    @ObservedObject var viewModel: SelectBoyOrGirlViewModel
   
    init(columnSeats: [ColumnSeats], state: StudentState) {
        viewModel = SelectBoyOrGirlViewModel(columnSeats: columnSeats, state: state)
    }
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("男女の座る席を選択")
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                Spacer()
                
                HStack {
                    Text("男子：\(viewModel.state.boysNumber)席")
                    Text("女子：\(viewModel.state.girlsNumber)席")
                    Text("にしてください")
                    
                }
                .padding(.bottom, 30)
                
                ForEach(viewModel.columnSeats) { column in
                    HStack {
                        ForEach(column.rowSeats, id: \.id) { row in
                            Group{
                                if row.isOn{
                                    Button(action: {
                                        self.viewModel.change(uuid: row.id)
                                    }){
                                        Image(systemName: "o.square")
                                            .foregroundColor(row.isBoy ? .blue : .red)
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
                
                HStack{
                    Text("青：男子\(viewModel.countBoySeats())")
                    Text("赤：女子\(viewModel.countgirlSeats())")
                }
                .padding(.vertical, 10)
                Spacer()
                
                if viewModel.state.boysNumber == viewModel.countBoySeats() && viewModel.state.girlsNumber == viewModel.countgirlSeats(){
                    NavigationLink(destination: PresetView(columnSeats: viewModel.columnSeats, state: viewModel.state)){
                        VStack{
                            Text("　")
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


//    struct SelectBoyOrGirl_Previews: PreviewProvider {
//        static var previews: some View {
//            SelectBoyOrGirl()
//
//        }
//}



