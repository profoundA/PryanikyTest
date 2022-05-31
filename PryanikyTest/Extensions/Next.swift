//
//  Next.swift
//  PryanikyTest
//
//  Created by Andrey Lobanov on 27.05.2022.
//

import UIKit

public protocol Next { }

extension Next where Self: AnyObject {
    public func next(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

extension NSObject: Next {}

