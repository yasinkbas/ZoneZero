//
//  RegisterView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterViewDelegate: class {
    func registerView(_ registerView: RegisterView, didTapActionButton actionButton: ZZButton, viewModel: Register.FormModel.ViewModel)
    func registerView(_ registerView: RegisterView, didTapAlternateButton alternateButton: ZZButton, viewModel: Register.FormModel.ViewModel)
}

class RegisterView: AuthView {
    
    weak var delegate: RegisterViewDelegate?
    
    override var alternateButtonTitle: String { "Do you have already an account?" }
    
    override func initial() {
        super.initial()
        formView = RegisterFormView()
    }
    
    override func setupListeners() {
        super.setupListeners()
        formView.delegate = self
        alternateButton.addTarget(self, action: #selector(didTapAlternateButton), for: .touchUpInside)
    }
    
    @objc
    func didTapAlternateButton(_ sender: ZZButton) {
        delegate?.registerView(self, didTapAlternateButton: sender, viewModel: composeFormViewModel(from: formView))
    }
    
    private func composeFormViewModel(from actionFormView: ActionFormView) -> Register.FormModel.ViewModel {
        let name        = actionFormView.getTextFieldText(with: "name")
        let username    = actionFormView.getTextFieldText(with: "username")
        let password    = actionFormView.getTextFieldText(with: "password")
        let repassword  = actionFormView.getTextFieldText(with: "re-password")
        
        return .init(name: name, username: username, password: password, repassword: repassword)
    }
}

extension RegisterView {
    class RegisterFormView: ActionFormView {
        init() {
            super.init(
                actionType: .go,
                items: [
                    FormTextFieldItem(id: "name", image: UIImage(named: "name")!, placeholder: "Name", isSecured: false),
                    FormTextFieldItem(id: "username", image: UIImage(named: "user")!, placeholder: "Username", isSecured: false),
                    FormTextFieldItem(id: "password", image: UIImage(named: "password")!, placeholder: "Password", isSecured: true),
                    FormTextFieldItem(id: "re-password", image: UIImage(named: "password")!, placeholder: "ReType Password", isSecured: true)
                ],
                title: ZZLabel(
                    text: "Register",
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

extension RegisterView: ActionFormViewDelegate {
    func actionFormViewDelegate(_ actionFormView: ActionFormView, didTapActionButton actionButton: ZZButton) {
        delegate?.registerView(self, didTapActionButton: actionButton, viewModel: composeFormViewModel(from: formView))
    }
}

