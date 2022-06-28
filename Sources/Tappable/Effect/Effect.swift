//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import UIKit

extension TappableView {
    
    open class Effect {
        
        /// Default is 1, increasing will make the effect stronger, decreasing will make the effect weaker
        public var effectMultiplier: CGFloat
        public var generalOptions: UIView.AnimationOptions = .allowUserInteraction
        
        public var durations: [TapState : Double]
        
        public init(effectMultiplier: CGFloat) {
            self.effectMultiplier = effectMultiplier
            durations = [
                .touchedDown : 0.2,
                .touchedDownMovedInside : 0.2,
                .touchedDownMovedOutside : 0.3,
                .touchedUpInside : 0.3,
                .touchedUpOutside : 0.3
            ]
        }
        
        open func animate(_ view: TappableView, forState state: TappableView.TapState) {
        }
        
        func duration(forAnimatingState state: TapState) -> Double {
            if let duration = durations[state] {
                return duration
            }
            return 0.2
        }
    }
    
}

