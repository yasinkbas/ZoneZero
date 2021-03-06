//
//  CheckboxLabel.swift
//  Mobillium-case
//
//  Created by yasinkbas on 23.07.2020.
//

import Foundation

class CheckboxLabel: ZoneZeroCheckbox {
    let title: String
    
    lazy var label = ZoneZeroLabel(
        text: title,
        textStyle: .callout,
        color: .white,
        textAlignment: .left,
        fontName: .avenirNext_demibold,
        fontSize: 16
    )
    
    init(title: String) {
        self.title = title
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup() {
        super.setup()
        
    }
    
    override func customizeAppearance() {
        super.customizeAppearance()
        addSubview(label)
        label.set(
            .topOf(self),
            .rightOf(self),
            .leftOf(self, super._width + 5)
        )
    }
}
