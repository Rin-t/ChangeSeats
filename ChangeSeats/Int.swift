//
//  Int.swift
//  ChangeSeats
//
//  Created by Rin on 2020/09/05.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import Foundation

extension Int {
    func times (iterator: () -> Void) {
        for _ in 0 ..< self {
            iterator()
        }
    }
}
