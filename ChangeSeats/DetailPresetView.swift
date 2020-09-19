//
//  DetailPresetView.swift
//  ChangeSeats
//
//  Created by Rin on 2020/09/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI
class DetailPresetViewModel: ObservableObject {
    @Published var columnSeats: [ColumnSeats]
    @Published var state: StudentState
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        self.columnSeats = columnSeats
        self.state = state
    }
    
    func change(uuid: UUID, number: Int) {
        for columnIndex in 0..<columnSeats.count {
            for rowIndex in 0..<columnSeats[columnIndex].rowSeats.count {
                if columnSeats[columnIndex].rowSeats[rowIndex].id == uuid {
                    columnSeats[columnIndex].rowSeats[rowIndex].number = number
                }
            }
        }
    }
    
}


struct DetailPresetView: View {
    @State var id: UUID
    @ObservedObject var viewModel: DetailPresetViewModel
    @State var number: Int = 1
    var studentNumber: Int
    
    

    var body: some View {
        VStack{
            Text("この席に座る人の番号を選択")
          Picker(selection: $number, label: Text("")) {
                ForEach(1..<studentNumber + 1, id: \.self) { index in
                    Text(String(index))
                }
            }
            .frame(width: 200)
        }.onDisappear{
            self.viewModel.change(uuid: self.id, number: self.number)
        }
    }
}

//struct DetailPresetView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPresetView()
//    }
//}
