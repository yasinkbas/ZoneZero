//
//  OvalActionButton.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class OvalActionButton: MCButton {
    
    init(backgroundColor: UIColor, image: UIImage) {
        super.init(backgroundColor: backgroundColor, title: "")
        self.imageView?.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class OvalGradientActionButton: OvalActionButton {
    private var shadowLayer: CAShapeLayer!
    private var hasShadowLayer = false
    private var shadowLayerCount = 0
    
    let colors: [UIColor]
    
    init(colors: [UIColor], image: UIImage = .init()) {
        self.colors = colors
        super.init(backgroundColor: .clear, image: image)
        customizeAppearance()
    }
    
    convenience init(colors: [UIColor], symbol: String) {
        self.init(colors: colors)
        customizeAppearance(with: symbol)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customizeAppearance(with symbol: String? = nil) {
        setTitle(symbol, for: .normal)
        setTitleColor(.white, for: .normal)
    }
    
    func setupGradientLayer(cornerRadius: CGFloat) {
        let gradientLayer = MCGradientLayer(
            frame: bounds,
            colors: colors,
            locations: [0.0, 1.0],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 1.0)
        )
        
        gradientLayer.cornerRadius = cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func setupShadowLayer(cornerRadius: CGFloat) {
        if hasShadowLayer && shadowLayerCount > 2 { return }
        shadowLayerCount += 1
        hasShadowLayer  = true
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 0.8
        shadowLayer.shadowRadius = 5
        
        layer.insertSublayer(shadowLayer, at: 0)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = bounds.height / 2
        
        setupGradientLayer(cornerRadius: cornerRadius)
        setupShadowLayer(cornerRadius: cornerRadius)
    }
}
