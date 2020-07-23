//
//  ZZLabel.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ZZLabel: UILabel {
    
    init(
        text: String                    = .none,
        textStyle: UIFont.TextStyle     = .body,
        color: UIColor                  = .secondaryLabel,
        textAlignment: NSTextAlignment  = .center,
        fontName: String                = .none,
        weight: UIFont.Weight           = .regular,
        fontSize: CGFloat               = 14
    ) {
        super.init(frame: .zero)
        self.text                       = text
        self.font                       = UIFont.preferredFont(forTextStyle: textStyle)
        self.textColor                  = color
        self.textAlignment              = textAlignment
        self.font                       = .systemFont(ofSize: fontSize, weight: weight)
        setFont(fontName: fontName, size: fontSize)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setFont(fontName: String, size: CGFloat) {
        if fontName != .none {
            self.font = UIFont(name: fontName, size: size)
        }
    }
    
    func configureAppearance() {
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.75
    }
}
