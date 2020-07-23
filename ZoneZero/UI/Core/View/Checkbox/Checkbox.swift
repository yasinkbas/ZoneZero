//
//  ZoneZeroCheckbox.swift
//  Mobillium-case
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol CheckboxDelegate: class {
    func checkbox(_ checkbox: ZoneZeroCheckbox, didTapCheckBox isChecked: Bool)
}

class ZoneZeroCheckbox: UIView {
    
    weak var delegate: CheckboxDelegate?
    
    let _width: CGFloat         = 20
    let _height: CGFloat        = 20
    let cornerRadius: CGFloat   = 5
    let checkMarkWidth: CGFloat = 3
    
    lazy var frameLayer = CAShapeLayer().then { frameLayer in
        let path                = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: _width, height: _height), cornerRadius: cornerRadius)
        frameLayer.path         = path.cgPath
        frameLayer.strokeColor  = UIColor.black.cgColor
        frameLayer.fillColor    = UIColor.white.cgColor
    }
    
    lazy var checkMarkLayer = CAShapeLayer().then { checkLayer in
        let path = UIBezierPath()
        path.move               (to: CGPoint(x: 5, y: _height / 2))
        path.addLine            (to: CGPoint(x: 5 + _width / 4, y: _height - 5))
        path.addLine            (to: CGPoint(x: _width - 5, y: 5))
        
        checkLayer.path         = path.cgPath
        checkLayer.strokeColor  = UIColor.black.cgColor
        checkLayer.fillColor    = UIColor.clear.cgColor
        checkLayer.lineWidth    = checkMarkWidth
    }
    
    var isChecked: Bool = false {
        didSet {
            isChecked ? layer.addSublayer(checkMarkLayer) : checkMarkLayer.removeFromSuperlayer()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        customizeAppearance()
        layer.addSublayer(frameLayer)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    func tapped(_ sender: UITapGestureRecognizer) {
        isChecked.toggle()
        delegate?.checkbox(self, didTapCheckBox: isChecked)
    }
    
    func customizeAppearance() {
        // the content will be filled in subclasses
    }
}
