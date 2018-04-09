import XCTest

import TMDbAPITests

var tests = [XCTestCaseEntry]()
tests += TMDbAPITests.allTests()
XCTMain(tests)