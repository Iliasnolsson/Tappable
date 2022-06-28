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
        
        public static var bounce: BounceEffect {.init()}
        public static var bounceStrong: BounceEffect {.init(effectMultiplier: 1.2)}
        public static var bounceLight: BounceEffect {.init(effectMultiplier: 0.8)}
        
        public static var higlight: HighlightEffect {.init()}
        public static var higlightStrong: HighlightEffect {.init(effectMultiplier: 1.2)}
        public static var higlightLight: HighlightEffect {.init(effectMultiplier: 0.8)}
    }
    
}

