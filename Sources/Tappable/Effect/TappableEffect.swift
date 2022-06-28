//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import Foundation

public protocol TappableEffect {
    
    func animate(_ view: TappableView, forState state: TappableView.TapState)
    
}
