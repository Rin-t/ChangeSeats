//
//  ShareData.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/16.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import Foundation

class ShareData: ObservableObject {
    @Published var boys = 15
    @Published var girls = 15
    @Published var columns = 5
    @Published var rows = 5
    @Published var usedSeats = [Bool](repeating: true, count: 64)
    @Published var boysSeats = [Bool](repeating: true, count: 64)
    @Published var girlsSeats = [Bool](repeating: true, count: 25)
}
