//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import UIKit
import GeneralHelper

extension TappableView {
    
    class HighlightEffect: Effect {
        
        private var touchDownColor: UIColor?
        
        public override init(effectMultiplier: CGFloat = 1) {
            super.init(effectMultiplier: effectMultiplier)
        }
        
        public override func animate(_ view: TappableView, forState state: TappableView.TapState) {
            let duration = duration(forAnimatingState: state)
            switch state {
            case .touchedDown, .touchedDownMovedInside:
                var options: UIView.AnimationOptions = [.curveEaseOut]
                options.update(with: generalOptions)
                touchDownColor = view.backgroundColor
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: options) { [weak self] in
                    view.backgroundColor = view.backgroundColor?.higlight(percentage: 0.2 * (self?.effectMultiplier ?? 1))
                }
                break
            case .touchedUpOutside, .touchedDownMovedOutside:
                var options: UIView.AnimationOptions = [.curveEaseOut]
                options.update(with: generalOptions)
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: options) { [weak self] in
                    view.backgroundColor = self?.touchDownColor ?? .clear
                }
                break
            case .touchedUpInside:
                var options: UIView.AnimationOptions = [.curveEaseOut]
                options.update(with: generalOptions)
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: options) { [weak self] in
                    view.backgroundColor = self?.touchDownColor ?? .clear
                }
                break
            }
        }
        
    }

    
}
