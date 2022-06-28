//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2022-06-28.
//

import GeneralHelper
import UIKit

open class TitledTappableView: TappableView {
    
    public let titleLabel = Label()
    
    public override init() {
        super.init()
        construct()
        constrain()
    }
    
    private func construct() {
        addSubview(titleLabel)
    }
    
    private func constrain() {
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        do {
            let widthWeak = widthAnchor.constraint(greaterThanOrEqualTo: titleLabel.widthAnchor)
            let heigthWeak = heightAnchor.constraint(greaterThanOrEqualTo: titleLabel.heightAnchor)
            widthWeak.priority = .init(850)
            heigthWeak.priority = .init(850)
            widthWeak.isActive = true
            heigthWeak.isActive = true
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
