import UIKit

extension NSLayoutConstraint {
    public convenience init(item view1: AnyObject, toItem view2: AnyObject? = nil, attribute attr1: NSLayoutAttribute, relatedBy relation: NSLayoutRelation = .Equal, attribute attr2: NSLayoutAttribute? = nil, multiplier: CGFloat = 1, constant c: CGFloat = 0) {
        let attribute2: NSLayoutAttribute = view2 == nil ? .NotAnAttribute : (attr2 ?? attr1)
        self.init(item: view1, attribute: attr1, relatedBy: relation, toItem: view2, attribute: attribute2, multiplier: multiplier, constant: c)
    }

    public class func constraintsWithSuperview(superview: UIView, subview: UIView, insets: UIEdgeInsets, localized: Bool = true) -> [NSLayoutConstraint] {
        return [
            NSLayoutConstraint(item: superview, toItem: subview, attribute: .Top, constant: insets.top),
            NSLayoutConstraint(item: superview, toItem: subview, attribute: (localized ? .Leading : .Left), constant: insets.left),
            NSLayoutConstraint(item: superview, toItem: subview, attribute: .Bottom, constant: insets.bottom),
            NSLayoutConstraint(item: superview, toItem: subview, attribute: (localized ? .Trailing : .Right), constant: insets.right)
        ]
    }
}
