//
//  SelectUnusedSeats.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/14.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct SelectUnusedSeats: View {
    @State var seatsBool = []
    
    var body: some View {
        ZStack{
            Color(red: 229/255, green: 250/255, blue: 248/255)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                ForEach(0..<6) { nu in
                    HStack {
                        ForEach(0..<6) { num in
                            Image(systemName: "o.square")
                            
                        }
                        .font(.system(size: 40))
                    }
                }
            }
        }
    }
}

struct SelectUnusedSeats_Previews: PreviewProvider {
    static var previews: some View {
        SelectUnusedSeats()
    }
}
