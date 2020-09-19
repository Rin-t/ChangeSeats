//
//  ChangeSeatsTest.swift
//  ChangeSeatsTest
//
//  Created by Rin on 2020/09/19.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import XCTest

class ChangeSeatsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var columnSeat: [ColumnSeats] = [ColumnSeats(id: UUID(), rowSeats: [Seat(id: UUID(), isOn: true, isBoy: true, number: nil),Seat(id: UUID, isOn: true, isBoy: true, number: nil),Seat(id: UUID, isOn: true, isBoy: true, number: nil),Seat(id: UUID, isOn: true, isBoy: true, number: nil),Seat(id: UUID, isOn: true, isBoy: true, number: nil)])]
        var studentState: StudentState =  StudentState(boysNum: 5, girlsNum: 0, total: 5)
        var viewModel = SelectBoyOrGirlViewModel(columnSeats: columnSeat, state: StudentState)

        viewModel.change(uuid: UUID)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
