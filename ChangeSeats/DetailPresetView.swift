//
//  DetailPresetView.swift
//  ChangeSeats
//
//  Created by Rin on 2020/09/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI
class DetailPresetViewModel: ObservableObject {
    
    @Published var studentNumber: Int

    init(studentNumber: Int) {
    
        self.studentNumber = studentNumber
        
    }

    func change(uuid: UUID, number: Int) {

        for columnIndex in 0..<columnSeats.count {
            for rowIndex in 0..<columnSeats[columnIndex].rowSeats.count {
                if columnSeats[columnIndex].rowSeats[rowIndex].id == uuid {
                    columnSeats[columnIndex].rowSeats[rowIndex].number = number
                    print(columnSeats[columnIndex].rowSeats[rowIndex].number!)
                    print(columnSeats[columnIndex].rowSeats[rowIndex].id)
                }
            }
        }
    }
}


struct DetailPresetView: View {
    
    @ObservedObject var viewModel: DetailPresetViewModel
    @State var number: Int = 1
    @State var columnSeats: [ColumnSeats]
    @State var rowId: UUID
    
    init(rowId: UUID, studentNumber: Int) {
        viewModel = DetailPresetViewModel(studentNumber: studentNumber)
    }
    
    
    
    var body: some View {
        VStack{
            Text("この席に座る人の番号を選択")
            Picker(selection: $number, label: Text("")) {
                ForEach(1..<viewModel.studentNumber + 1, id: \.self) { index in
                    Text(String(index))
                }
            }
            .frame(width: 200)
        }
        .onAppear{
            print("modal")
            print(self.rowId)
            print("StudentNumber")
            print(self.viewModel.studentNumber)
        }
        .onDisappear{
            self.viewModel.change(uuid: self.viewModel.rowId, number: self.number)
            print("a")
        }
    }
}

//struct DetailPresetView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPresetView()
//    }
//}



