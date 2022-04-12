//
//  CellExtensions.swift
//  Sweet Tooth
//
//  Created by Coding on 4/9/22.
//

import Foundation
import UIKit

extension NSObject {
    static var reuseIdentifier: String {
        return className
    }

    static var className: String {
        guard let s = NSStringFromClass(self).components(separatedBy: ".").last else { fatalError("Invalid Class name: \(self)") }
        return s
    }
}

extension UITableViewCell {
    class func register(forTableView tv: UITableView) {
        tv.register(self, forCellReuseIdentifier: reuseIdentifier)
    }

    class func dequeueReusableCell(forTableView tv: UITableView, forIndexPath indexPath: IndexPath) -> Self {
        let cell = tv.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.accessibilityIdentifier = nil
        cell.textLabel?.accessibilityIdentifier = nil
        cell.detailTextLabel?.accessibilityIdentifier = nil
        cell.isUserInteractionEnabled = true
        return objcast(cell)
    }
}

extension UICollectionReusableView {
    class func registerSupplementaryView(forCollectionView cv: UICollectionView, kind: String) {
        cv.register(self, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
    }

    class func dequeueReusableSupplementaryView(forCollectionView cv: UICollectionView, kind: String, forIndexPath indexPath: IndexPath) -> Self {
        let view = cv.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath)
        return objcast(view)
    }
}

extension UICollectionViewCell {
    class func register(forCollectionView cv: UICollectionView) {
        cv.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    class func dequeueReusableCellForCollectionView(_ cv: UICollectionView, forIndexPath indexPath: IndexPath) -> Self {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return objcast(cell)
    }
}

func objcast<T>(_ obj: AnyObject) -> T {
    return obj as! T
}
