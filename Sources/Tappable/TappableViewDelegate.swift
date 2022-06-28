//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import UIKit

public protocol TappableViewDelegate: AnyObject {
    
    func tapped(_ tappableView: TappableView, recognizer: UIGestureRecognizer)
    
}
