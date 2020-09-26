//
//  ChangeSeatsTests.swift
//  ChangeSeatsTests
//
//  Created by Rin on 2020/08/13.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import XCTest
@testable import ChangeSeats

class ChangeSeatsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let uuid = UUID()
        let columnSeat: [ColumnSeats] = [ColumnSeats(id: UUID(), rowSeats: [Seat(id: uuid, isOn: true, isBoy: true, number: nil),Seat(id: UUID(), isOn: true, isBoy: true, number: nil),Seat(id: UUID(), isOn: true, isBoy: true, number: nil),Seat(id: UUID(), isOn: true, isBoy: true, number: nil),Seat(id: UUID(), isOn: true, isBoy: true, number: nil)])]
        let studentState: StudentState =  StudentState(boysNum: 5, girlsNum: 0, total: 5)
        let viewModel = SelectBoyOrGirlViewModel(columnSeats: columnSeat, state: studentState)

        viewModel.change(uuid: uuid)
        
        var counter = 0
        
        for columnSeat in viewModel.columnSeats {
            for rowSeat in columnSeat.rowSeats {
                if rowSeat.isBoy == true {
                    counter += 1
                }
            }
        }
        
        XCTAssertEqual(4, counter)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
