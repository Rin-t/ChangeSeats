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
    
}


struct DetailPresetView: View {
    //var id: UUID
    //@ObservedObject var viewModel: DetailPresetViewModel
    //@State var number: Int = 9
    
//    init(columnSeats: [ColumnSeats], state: StudentState) {
//        viewModel = DetailPresetViewModel(columnSeats: columnSeats, state: state)
//    }
    
    var body: some View {
        VStack{
            Text("この席に座る人の番号を選択")
//            Picker(selection: $number, label: Text(" ")) {
//                
//            }

        }.onAppear{
            //print(self.id)
        }
    }
}

//struct DetailPresetView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPresetView()
//    }
//}
