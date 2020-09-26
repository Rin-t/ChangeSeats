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
    
    @Published var showingBoyModal: Bool = false
    @Published var showingGirlModal = false
    
    var selectedStudentId: UUID?
    
    var boyNumber: Int {
        var counter = 0
        for columnSeat in columnSeats {
            for seat in columnSeat.rowSeats {
                if seat.isBoy {
                    counter += 1
                }
            }
        }
        return counter
    }
    
    var girlNumber: Int {
        var counter = 0
        for columnSeat in columnSeats {
            for seat in columnSeat.rowSeats {
                if !seat.isBoy {
                    counter += 1
                }
            }
        }
        return counter
    }
    
    var selectedStudentColumnAndRow: (Int, Int)? {
        guard let selectedStudentId = selectedStudentId else {
            return nil
        }
        
        for (column, columnSeat) in columnSeats.enumerated() {
            for (row, seat) in columnSeat.rowSeats.enumerated() {
                if selectedStudentId == seat.id {
                    return (column, row)
                }
            }
        }
        return nil
    }
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        self.columnSeats = columnSeats
        self.state = state
    }
    
    func boySeatTapped(id: UUID) {
        showingBoyModal = true
        selectedStudentId = id
    }
    
    func girlSeatTapped(id: UUID) {
        showingGirlModal = true
        selectedStudentId = id
    }
    
//    func change(uuid: UUID, number: Int) {
//
//        for columnIndex in 0..<columnSeats.count {
//            for rowIndex in 0..<columnSeats[columnIndex].rowSeats.count {
//                if columnSeats[columnIndex].rowSeats[rowIndex].id == uuid {
//                    columnSeats[columnIndex].rowSeats[rowIndex].number = number
//                    print(columnSeats[columnIndex].rowSeats[rowIndex].id)
//                    break
//                }
//            }
//        }
//    }
    
}

class PresetNumber: ObservableObject {
    @Published var number: Int = 1
}

struct PresetView: View {
    
    @ObservedObject var viewModel: PresetViewModel
    
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
                                        print("boy")
                                        self.viewModel.boySeatTapped(id: row.id)
                                    }){
                                        Image(systemName: "o.square")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 40))
                                    }
                                    .sheet(isPresented: self.$viewModel.showingBoyModal){
                                        getModalOrEmptyView(columnAndRow: self.viewModel.selectedStudentColumnAndRow, isBoy: true)
                                    }
                                    
                                } else {
                                    Button(action: {
                                        print("girl")
                                        self.viewModel.girlSeatTapped(id: row.id)
                                    }){
                                        Image(systemName: "o.square")
                                            .foregroundColor(.red)
                                            .font(.system(size: 40))
                                    }
                                    .sheet(isPresented: self.$viewModel.showingGirlModal){
                                        getModalOrEmptyView(columnAndRow: self.viewModel.selectedStudentColumnAndRow, isBoy: false)
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
    
    private func getModalOrEmptyView(columnAndRow: (Int, Int)?, isBoy: Bool) -> AnyView {
        guard let columnAndRow = viewModel.selectedStudentColumnAndRow else {
            return AnyView(EmptyView())
        }
        let studentNumber = isBoy ? viewModel.boyNumber : viewModel.girlNumber
        return AnyView(DetailPresetView(columnAndRow: columnAndRow, studentNumber: studentNumber, columnSeats: $viewModel.columnSeats))
    }
}

//struct PresetView_Previews: PreviewProvider {
//    static var previews: some View {
//        PresetView()
//    }
//}
