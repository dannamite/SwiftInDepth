//  StringTreeTests.swift
//  Copyright © 2015 Allen Holub. All rights reserved.
//

import XCTest
@testable import SwiftExercises

class StringTreeTests: XCTestCase {

    var t: StringTree! = nil
    
    override func setUp() {
        super.setUp()
        t = StringTree( ["d", "b", "f", "a", "c", "e", "g"] )
    }

    func testTreeStructure() {
        XCTAssertTrue( t._verifyChildren("d", left: "b", right: "f") )
        XCTAssertTrue( t._verifyChildren("b", left: "a", right: "c") )
        XCTAssertTrue( t._verifyChildren("f", left: "e", right: "g") )
        XCTAssertTrue( t._verifyChildren("a", left: nil, right: nil) )
        XCTAssertTrue( t._verifyChildren("c", left: nil, right: nil) )
        XCTAssertTrue( t._verifyChildren("e", left: nil, right: nil) )
        XCTAssertTrue( t._verifyChildren("g", left: nil, right: nil) )

        t.add("h")

        XCTAssertTrue( t._verifyChildren("d", left: "b", right: "f") )
        XCTAssertTrue( t._verifyChildren("b", left: "a", right: "c") )
        XCTAssertTrue( t._verifyChildren("f", left: "e", right: "g") )
        XCTAssertTrue( t._verifyChildren("a", left: nil, right: nil) )
        XCTAssertTrue( t._verifyChildren("c", left: nil, right: nil) )
        XCTAssertTrue( t._verifyChildren("e", left: nil, right: nil) )
        XCTAssertTrue( t._verifyChildren("g", left: nil, right: "h") )
        XCTAssertTrue( t._verifyChildren("h", left: nil, right: nil) )
    }

    func testArrayInit() {
        let t = StringTree( ["a", "b", "c"] )
        XCTAssertTrue( t.contains("a") && t.contains("b") && t.contains("c") )
    }

    func testZeroAndOneElement() {
        t.clear()
        XCTAssertTrue( t.isEmpty    )
        XCTAssertNil ( t.smallest() )
        XCTAssertNil ( t.largest()  )

        t.add( "x" );

        XCTAssertTrue( t.count      ==  1  )
        XCTAssertTrue( t.smallest() == "x" )
        XCTAssertTrue( t.largest()  == "x" )
    }

    func testContains() {
        XCTAssertTrue ( t.contains("a") )
        XCTAssertTrue ( t.contains("b") )
        XCTAssertTrue ( t.contains("c") )
        XCTAssertTrue ( t.contains("d") )
        XCTAssertTrue ( t.contains("e") )
        XCTAssertTrue ( t.contains("f") )
        XCTAssertTrue ( t.contains("g") )
        XCTAssertFalse( t.contains("h") )
    }

    func testFindMatchOf() {
        XCTAssertTrue ( t.findMatchOf("a") == "a" )
        XCTAssertTrue ( t.findMatchOf("b") == "b" )
        XCTAssertTrue ( t.findMatchOf("c") == "c" )
        XCTAssertTrue ( t.findMatchOf("d") == "d" )
        XCTAssertTrue ( t.findMatchOf("e") == "e" )
        XCTAssertTrue ( t.findMatchOf("f") == "f" )
        XCTAssertTrue ( t.findMatchOf("g") == "g" )
        XCTAssertNil  ( t.findMatchOf("h") )
    }
}