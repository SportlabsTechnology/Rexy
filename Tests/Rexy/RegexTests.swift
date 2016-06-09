import XCTest
@testable import Rexy

class RegexTests: XCTestCase {

  static var allTests: [(String, (RegexTests) -> () throws -> Void)] {
    return [
      ("testInitWithValidPattern", testInitWithValidPattern),
      ("testInitWithInvalidPattern", testInitWithInvalidPattern),
      ("testMatches", testMatches),
      ("testNotMatches", testNotMatches),
      ("testGroup", testGroup),
      ("testGroups", testGroups),
      ("testNoGroups", testNoGroups)
    ]
  }

  // MARK: - Tests

  func testInitWithValidPattern() {
    var regex: Regex?

    do {
      regex = try Regex(pattern: "rexy")
    } catch {
      XCTFail("`Regex` throws an error: \(error)")
    }

    XCTAssertNotNil(regex)
  }

  func testInitWithInvalidPattern() {
    var regex: Regex?

    do {
      regex = try Regex(pattern: "|-)'-'(-|")
      XCTFail("`Regex` does not throw an error")
    } catch {
      print(error)
    }

    XCTAssertNil(regex)
  }

  func testMatches() {
    let regex = try! Regex(pattern: "Tyrannosaurus")
    let result = regex.matches("Tyrannosaurus")

    XCTAssertTrue(result)
  }

  func testNotMatches() {
    let regex = try! Regex(pattern: "Tyrannosaurus")
    let result = regex.matches("Spinosaurus")

    XCTAssertFalse(result)
  }

  func testGroup() {
    let regex = try! Regex(pattern: "(Tyrannosaurus)")
    let groups = regex.groups("Tyrannosaurus")

    XCTAssertEqual(groups, ["Tyrannosaurus"])
  }

  func testGroups() {
    let regex = try! Regex(pattern: "(Tyrannosaurus) (Rex)")
    let groups = regex.groups("Tyrannosaurus Rex")

    XCTAssertEqual(groups, ["Tyrannosaurus", "Rex"])
  }

  func testNoGroups() {
    let regex = try! Regex(pattern: "(Tyrannosaurus)")
    let groups = regex.groups("Spinosaurus")

    XCTAssertTrue(groups.isEmpty)
  }
}