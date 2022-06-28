//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import UIKit

public extension TappableView {
    
    struct Corners {
        /// Default is 3, Corner Radius of background
        public var value: CGFloat = 3
        /// Default is constant, How the corner radius value should be interperted
        public var valueType: ValueType
        
        init(_ value: CGFloat, valueType: ValueType = .constant) {
            self.value = value
            self.valueType = valueType
        }
        
        init() {
            self.value = 3
            self.valueType = .constant
        }
        
        public enum ValueType {
            case constant
            case percentageOfHeight
            case percentageOfWidth
            case percentageOfSizeMax
            case percentageOfSizeMin
        }
        
        func radius(forViewSize size: CGSize) -> CGFloat {
            switch valueType {
            case .constant:
                return value
            case .percentageOfHeight:
                return value * size.height
            case .percentageOfWidth:
                return value * size.width
            case .percentageOfSizeMax:
                return value * max(size.width, size.height)
            case .percentageOfSizeMin:
                return value * min(size.width, size.height)
            }
        }
    }
    
}
