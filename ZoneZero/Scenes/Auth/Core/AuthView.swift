//
//  AuthView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

class AuthView: ZZView {
    
    var formView: ActionFormView!
    var alternateButtonTitle: String { .none }
    
    lazy var backgroundImageView = UIImageView().then { imageView in
        imageView.image         = UIImage(named: "background")
        imageView.contentMode   = .scaleAspectFill
    }
    
    lazy var logoView = UIImageView().then { imageView in
        imageView.image                 = UIImage(named: "logo")
        imageView.contentMode           = .scaleToFill
        imageView.clipsToBounds         = true
        imageView.layer.cornerRadius    = 32
        imageView.layer.masksToBounds   = true
    }
    
    lazy var alternateButton = ZZButton(
        backgroundColor: .clear,
        title: alternateButtonTitle
    )
    
    override func configureAppearance() {
        initial()
        addSubview(backgroundImageView)
        backgroundImageView.equalToSuper()
        
        addSubview(logoView)
        logoView.set(.topOf(self, 64), .centerXOf(self), .widthMultiple(self.width, 0.5), .heightMultiple(self.width, 0.25))
        
        addSubview(formView)
        let formViewSuggestedSize = formView.suggestedSize(self)
        formView.set(.center(self), .widthOf(self, formViewSuggestedSize.width), .height(formViewSuggestedSize.height))
        
        addSubview(alternateButton)
        alternateButton.set(.top(formView.bottom, 16), .centerXOf(formView), .widthMultiple(formView.width, 0.9), .height(50))
    }
    
    func initial() {
        // the content will be filled in subclasses
    }
}
