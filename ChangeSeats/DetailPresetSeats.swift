//
//  DetailPresetSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/09/12.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct DetailPresetSeats: View {
    var num: UUID
    var body: some View {
        VStack{
           Text("a")
        }.onAppear{
            self.a()
        }
    }
    func a() {
        print(num)
    }
}

//struct DetailPresetSeats_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPresetSeats()
//    }
//}
