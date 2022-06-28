//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import GeneralHelper
import UIKit

open class TappableView: View {
    
    var effect: TappableEffect?
    private(set) var tapState: TapState?
    
    public weak var delegate: TappableViewDelegate?
    
    override public init() {
        super.init()
        setup()
    }
    
    private func setup() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(press))
        gesture.minimumPressDuration = 0
        addGestureRecognizer(gesture)
    }
    
    private func setState(_ newState: TapState?) {
        if newState == tapState || tapState == .touchedDown && newState == .touchedDownMovedInside {return}
        var reportedState = {() -> TapState in
            if let newState = newState {
                return newState
            }
            return tapState == .touchedDownMovedOutside ? .touchedUpOutside : .touchedUpInside
        }()
        tapState = reportedState
        effect?.animate(self, forState: reportedState)
        switch reportedState {
        case .touchedUpInside, .touchedUpOutside:
            tapState = nil
            break
        case .touchedDownMovedInside:
            tapState = .touchedDown
            break
        default:
            tapState = reportedState
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Gesture Target
extension TappableView {
    
    @objc private func press(_ recognizer: UILongPressGestureRecognizer) {
        switch recognizer.state {
        case .began:
            setState(.touchedDown)
            break
        case .changed:
            let location = recognizer.location(in: self)
            setState(bounds.contains(location) ?
                .touchedDownMovedInside : .touchedDownMovedOutside)
            break
        case .ended, .cancelled:
            if (tapState == .touchedDown || tapState == .touchedDownMovedInside) {
                delegate?.tapped(self, recognizer: recognizer)
            }
            setState(nil)
            break
        default:
            break
        }
    }
    
}

// MARK: State Enum
public extension TappableView {
    
    enum TapState {
        /// Finger has touch down
        case touchedDown
        /// Finger has touch down & has now moved outside given view
        case touchedDownMovedOutside
        /// Finger has touch down, has moved outside given view & now enters given view again
        case touchedDownMovedInside
        /// Finger has touch down & now lifts up from screen outside given view
        case touchedUpOutside
        /// Finger has touch down & now lifts up from screen outside given view
        case touchedUpInside
    
        public var allCases: [TapState] {[
            .touchedDown,
            .touchedDownMovedInside,
            .touchedDownMovedOutside,
            .touchedUpInside,
            .touchedUpInside]}
        
    }
    
}
