//
//  PresetView.swift
//  ChangeSeats
//
//  Created by Rin on 2020/09/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

class PresetViewModel: ObservableObject {
    @Published var columnSeats: [ColumnSeats]
    @Published var state: StudentState
    @Published var passId = UUID()
    
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        self.columnSeats = columnSeats
        self.state = state
    }
    
    func change(uuid: UUID, number: Int) {
        
        for columnIndex in 0..<columnSeats.count {
            for rowIndex in 0..<columnSeats[columnIndex].rowSeats.count {
                if columnSeats[columnIndex].rowSeats[rowIndex].id == uuid {
                    columnSeats[columnIndex].rowSeats[rowIndex].number = number
                    print(columnSeats[columnIndex].rowSeats[rowIndex].id)
                    break
                }
            }
        }
    }
    
}


struct PresetView: View {
    
    @ObservedObject var viewModel: PresetViewModel
    @State var showingModal: Bool = false
    @State var showingGirlModal = false
    

    init(columnSeats: [ColumnSeats], state: StudentState) {
        viewModel = PresetViewModel(columnSeats: columnSeats, state: state)
    }
    
    var body: some View {
        VStack{
            
            ForEach(viewModel.columnSeats) { column in
                HStack {
                    ForEach(column.rowSeats, id: \.id) { row in
                        Group{
                            if row.number != nil{
                                Image(systemName: "\(row.number!).square")
                                    .font(.system(size: 40))
                            } else
                            if row.isOn {
                                if row.isBoy {
                                    Button(action: {
                                        self.showingModal = true
                                        self.viewModel.passId = row.id
                                        print("boy")
                                        print(row.id)
                                    }){
                                        Image(systemName: "o.square")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 40))
                                    }
                                    .sheet(isPresented: self.$showingModal){
                                        
                                        DetailPresetView(columnSeats: viewModel.columnSeats, rowId: row.id, studentNumber: viewModel.state.boysNumber)
                                    }
                                    
                                } else {
                                    Button(action: {
                                        self.showingGirlModal = true
                                        print("girl")
                                    }){
                                        Image(systemName: "o.square")
                                            .foregroundColor(.red)
                                            .font(.system(size: 40))
                                    }
                                    .sheet(isPresented: self.$showingGirlModal){
                                        // DetailPresetView(rowId: row.id, columnSeat: viewModel.columnSeats, studentNumber: viewModel.state.girlsNumber)
                                    }
                                }
                            } else {
                                Image(systemName: "xmark.square")
                                    .font(.system(size: 40))
                            }
                        }
                    }
                }
            }
        }.onAppear{
            print(self.viewModel.state.girlsNumber)
            print(self.viewModel.state.boysNumber)
        }
    }
}

//struct PresetView_Previews: PreviewProvider {
//    static var previews: some View {
//        PresetView()
//    }
//}
