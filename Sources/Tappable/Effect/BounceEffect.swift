//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import UIKit
import GeneralHelper

public extension TappableView {
    
    class BounceEffect: Effect {
        
        public override init(effectMultiplier: CGFloat = 1) {
            super.init(effectMultiplier: effectMultiplier)
        }
        
        public override func animate(_ view: TappableView, forState state: TappableView.TapState) {
            let duration = duration(forAnimatingState: state)
            switch state {
            case .touchedDown, .touchedDownMovedInside:
                var options: UIView.AnimationOptions = [.curveEaseOut]
                options.update(with: generalOptions)
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: options) { [weak self] in
                    view.transform = .init(scaleXY: 0.95 * (self?.effectMultiplier ?? 1))
                }
                break
            case .touchedUpOutside, .touchedDownMovedOutside:
                var options: UIView.AnimationOptions = [.curveEaseOut]
                options.update(with: generalOptions)
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: options) {
                    view.transform = .identity
                }
                break
            case .touchedUpInside:
                var options: UIView.AnimationOptions = [.curveEaseOut]
                options.update(with: generalOptions)
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: options) {
                    view.transform = .identity
                }
                break
            }
        }
    }
    
}
