//
//  RoundedBgLabel.swift
//  ZoneZero
//
//  Created by yasinkbas on 24.07.2020.
//

import UIKit

class RoundedBgLabel: ZoneZeroLabel {
    let cornerRadius: CGFloat
    
    init(
        text: String,
        textStyle: UIFont.TextStyle,
        textAlignment: NSTextAlignment,
        fontName: String,
        weight: UIFont.Weight,
        fontSize: CGFloat,
        color: UIColor,
        backgroundColor: UIColor,
        cornerRadius: CGFloat
    ) {
        self.cornerRadius = cornerRadius
        super.init(
            text: text,
            textStyle: textStyle,
            color: color,
            textAlignment: textAlignment,
            fontName: fontName,
            weight: weight,
            fontSize: fontSize
        )
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
