//
//  OvalButton.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

class OvalButton: ZZButton {
    let cornerRadius: CGFloat
    let titleFontSize: CGFloat
    
    init(
        backgroundColor: UIColor    = .clear,
        title: String               = .none,
        cornerRadius: CGFloat       = 8,
        titleFontSize: CGFloat      = 24
    ) {
        self.cornerRadius           = cornerRadius
        self.titleFontSize          = titleFontSize
        super.init(backgroundColor: backgroundColor, title: title)
        customizeAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeAppearance() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        titleLabel?.font = .systemFont(ofSize: titleFontSize)
    }
}
