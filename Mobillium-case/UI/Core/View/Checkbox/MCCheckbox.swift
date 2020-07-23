//
//  MCCheckbox.swift
//  Mobillium-case
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class MCCheckbox: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    init() {
        super.init(frame: .zero)
        customizeAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeAppearance() {
       
        
    }
    
    func setupShapeLayer() {
        let path = UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 160, height: 160), cornerRadius: 50)
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        layer.addSublayer(layer)
    }
    
}
