//
//  MCGradientLayer.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class MCGradientLayer: CAGradientLayer {
    
    init(
        frame: CGRect,
        colors: [UIColor],
        locations: [NSNumber],
        startPoint: CGPoint,
        endPoint: CGPoint
    ) {
        super.init()
        self.frame          = frame
        self.colors         = colors.map { $0.cgColor }
        self.locations      = locations
        self.startPoint     = startPoint
        self.endPoint       = endPoint
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
