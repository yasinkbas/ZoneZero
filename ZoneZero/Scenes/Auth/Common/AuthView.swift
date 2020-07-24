//
//  AuthView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

class AuthView: ZoneZeroView {
    
    var formView: ActionFormView!
    var alternateButtonTitle: String { .none }
    
    lazy var backgroundImageView = UIImageView().then { imageView in
        imageView.image         = UIImage(named: "auth-background2")
        imageView.contentMode   = .scaleAspectFill
    }
    
    lazy var logoView = UIImageView().then { imageView in
        imageView.image                 = UIImage(named: "logo")
        imageView.contentMode           = .scaleToFill
        imageView.clipsToBounds         = true
        imageView.layer.cornerRadius    = 32
        imageView.layer.masksToBounds   = true
    }
    
    lazy var alternateButton = ZoneZeroButton(
        backgroundColor: .clear,
        title: alternateButtonTitle
    )
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .systemPink
        initial()
    }
    
    override func setupLayout() {
        super.setupLayout()
        addSubview(backgroundImageView)
        backgroundImageView.equalToSuper()
        
        addSubview(logoView)
        logoView.set(
            .topOf(self, 64),
            .centerXOf(self),
            .widthMultiple(self.width, 0.5),
            .heightMultiple(self.width, 0.25)
        )
        
        addSubview(formView)
        let formViewSuggestedSize = formView.suggestedSize(self)
        formView.set(
            .center(self),
            .height(formViewSuggestedSize.height),
            .widthOf(self, formViewSuggestedSize.width)
        )
        
        addSubview(alternateButton)
        alternateButton.set(
            .height(50),
            .centerXOf(formView),
            .top(formView.bottom, 16),
            .widthMultiple(formView.width, 0.9)
        )
    }
    
    func initial() {
        // the content will be filled in subclasses
    }
}
