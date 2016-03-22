import UIKit

extension NSLayoutConstraint {
    public convenience init(item item1: AnyObject, attribute attribute1: NSLayoutAttribute, relation: NSLayoutRelation = .Equal, item item2: AnyObject? = nil, attribute attribute2: NSLayoutAttribute? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        let attribute = item2 == nil ? .NotAnAttribute : (attribute2 ?? attribute1)
        self.init(item: item1, attribute: attribute1, relatedBy: relation, toItem: item2, attribute: attribute, multiplier: multiplier, constant: constant)
    }

    public class func constraintsWithSuperview(superview: UIView, subview: UIView, insets: UIEdgeInsets, localized: Bool = true) -> [NSLayoutConstraint] {
        return [
            NSLayoutConstraint(item: superview, attribute: .Top, item: subview, constant: insets.top),
            NSLayoutConstraint(item: superview, attribute: (localized ? .Leading : .Left), item: subview, constant: -insets.left),
            NSLayoutConstraint(item: superview, attribute: .Bottom, item: subview, constant: insets.bottom),
            NSLayoutConstraint(item: superview, attribute: (localized ? .Trailing : .Right), item: subview, constant: insets.right)
        ]
    }
}
