import XCTest
import AutoLayout

class AutoLayoutTests: XCTestCase {
    func testInit() {
        let view1 = UIView()
        let view2 = UIView()

        var constraint = NSLayoutConstraint(item: view1, attribute: .Width)
        constraint.assert(item: view1, attribute: .Width)

        constraint = NSLayoutConstraint(item: view1, attribute: .Width, constant: 10)
        constraint.assert(item: view1, attribute: .Width, constant: 10)

        constraint = NSLayoutConstraint(item: view1, attribute: .Height, relatedBy: .GreaterThanOrEqual, constant: 10)
        constraint.assert(item: view1, attribute: .Height, relatedBy: .GreaterThanOrEqual, constant: 10)

        constraint = NSLayoutConstraint(item: view1, toItem: view2, attribute: .Top)
        constraint.assert(item: view1, toItem: view2, attribute: .Top)

        constraint = NSLayoutConstraint(item: view1, toItem: view2, attribute: .Bottom, constant: 10)
        constraint.assert(item: view1, toItem: view2, attribute: .Bottom, constant: 10)

        constraint = NSLayoutConstraint(item: view1, toItem: view2, attribute: .Top, relatedBy: .Equal, attribute: .CenterY, multiplier: 2, constant: 10)
        constraint.assert(item: view1, toItem: view2, attribute: .Top, relatedBy: .Equal, attribute: .CenterY, multiplier: 2, constant: 10)
    }
}

extension NSLayoutConstraint {
    func assert(item view1: AnyObject, toItem view2: AnyObject? = nil, attribute attr1: NSLayoutAttribute, relatedBy relation: NSLayoutRelation = .Equal, attribute attr2: NSLayoutAttribute? = nil, multiplier: CGFloat = 1, constant c: CGFloat = 0) {
        let attribute2: NSLayoutAttribute = view2 == nil ? .NotAnAttribute : (attr2 ?? attr1)
        XCTAssertTrue(firstItem === view1)
        XCTAssertEqual(firstAttribute, attr1)
        XCTAssertEqual(self.relation, relation)
        XCTAssertTrue(secondItem === view2)
        XCTAssertEqual(secondAttribute, attribute2)
        XCTAssertEqual(self.multiplier, multiplier)
        XCTAssertEqual(constant, c)
    }
}
