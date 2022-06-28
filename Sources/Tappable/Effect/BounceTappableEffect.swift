//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import UIKit
import GeneralHelper

public class BounceTappableEffect: TappableEffect {
    
    public func animate(_ view: TappableView, forState state: TappableView.TapState) {
        switch state {
        case .touchedDown, .touchedDownMovedInside:
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
                view.transform = .init(scaleXY: 0.8)
            }
            break
        case .touchedUpOutside, .touchedDownMovedOutside:
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7) {
                view.transform = .identity
            }
            break
        case .touchedUpInside:
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7) {
                view.transform = .identity
            }
            break
        }
    }
    
}
