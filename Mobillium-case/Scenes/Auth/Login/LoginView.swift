//
//  LoginView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class LoginView: MCView {
    
    lazy var imageView = UIImageView().then { imageView in
//        imageView.image = UIImage(named: "background-night")
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
    }
    
    lazy var formView = LoginFormView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override func configureAppearance() {
        addSubview(imageView)
        imageView.equalToSuper()
        
        addSubview(formView)
        formView.set(.center(self), .widthOf(self, formView.suggestedSize(self).width), .height(formView.suggestedSize(self).height))
        
    }
}

extension LoginView {
    class LoginFormView: ActionFormView {
        init() {
            super.init(
                actionType: .default,
                items: [
                    FormTextFieldItem(image: UIImage(named: "user")!, placeholder: "Username", isSecured: false),
                    FormTextFieldItem(image: UIImage(named: "password")!, placeholder: "Password", isSecured: true)
                ],
                title: MCLabel(
                    text: "Login",
                    textStyle: .title3,
                    color: .white,
                    textAlignment: .center,
                    fontName: .avenirNext_demibold,
                    fontSize: 32
                )
            )
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

