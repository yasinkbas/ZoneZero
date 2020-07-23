//
//  LoginView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol LoginViewDelegate: class {
    func loginView(_ loginView: LoginView, didTapActionButton actionButton: MCButton, viewModel: Login.FormModel.ViewModel)
    func loginView(_ loginView: LoginView, didTapAlternateButton alternateButton: MCButton, formModel: Login.FormModel.ViewModel)
}

final class LoginView: AuthView {
    
    weak var delegate: LoginViewDelegate?
    
    override var alternateButtonTitle: String { "Do you want to register" }
    
    lazy var remindMeCheckbox = UIView().then { checkbox in
        
    }
    
    override func initial() {
        super.initial()
        formView = LoginFormView()
    }
    
    override func setupListeners() {
        super.setupListeners()
        formView.delegate = self
        alternateButton.addTarget(self, action: #selector(didTapAlternateButton), for: .touchUpInside)
    }
    
    @objc
    func didTapAlternateButton(_ sender: MCButton) {
        delegate?.loginView(self, didTapAlternateButton: sender, formModel: getFormViewModel(from: formView))
    }
    
    private func getFormViewModel(from actionFormView: ActionFormView) -> Login.FormModel.ViewModel {
        let username = actionFormView.getTextFieldText(with: "username")
        let password = actionFormView.getTextFieldText(with: "password")
        
        return .init(username: username, password: password)
    }
}

extension LoginView {
    class LoginFormView: ActionFormView {
        init() {
            super.init(
                actionType: .default,
                items: [
                    FormTextFieldItem(id: "username", image: UIImage(named: "user")!, placeholder: "Username", isSecured: false),
                    FormTextFieldItem(id: "password", image: UIImage(named: "password")!, placeholder: "Password", isSecured: true)
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

extension LoginView: ActionFormViewDelegate {
    func actionFormViewDelegate(_ actionFormView: ActionFormView, didTapActionButton actionButton: MCButton) {
        delegate?.loginView(self, didTapActionButton: actionButton, viewModel: getFormViewModel(from: formView))
    }
}

