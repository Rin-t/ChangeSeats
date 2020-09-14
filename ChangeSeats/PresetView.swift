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
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        self.columnSeats = columnSeats
        self.state = state
    }
    
}


struct PresetView: View {
    
    @ObservedObject var viewModel: PresetViewModel
    
    init(columnSeats: [ColumnSeats], state: StudentState) {
        viewModel = PresetViewModel(columnSeats: columnSeats, state: state)
    }
    
    var body: some View {
        ForEach(viewModel.columnSeats) { column in
            HStack {
                ForEach(column.rowSeats, id: \.id) { row in
                    Group{
                        if row.isOn {
                            NavigationLink(destination: DetailPresetView(/*id: row.id)*/)) {
                                Image(systemName: "o.square")
                                    .foregroundColor(row.isBoy ? .blue : .red)
                                    .font(.system(size: 40))
                            }
                        } else {
                            Image(systemName: "xmark.square")
                                .font(.system(size: 40))
                        }
                    }
                    
                }
            }
        }
    }
}

//struct PresetView_Previews: PreviewProvider {
//    static var previews: some View {
//        PresetView()
//    }
//}
