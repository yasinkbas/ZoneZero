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
    
    lazy var remindMeCheckbox           = CheckboxLabel(title: "Remind me").then { remindMeCheckbox in
        remindMeCheckbox.delegate = self
    }
    
    lazy var acceptPromotionCheckbox    = CheckboxLabel(title: "I accept to get promotional e-mail from Mobillium about ZoneZero Program.")
        .then { checkboxLabel in
            checkboxLabel.label.numberOfLines   = 0
            checkboxLabel.label.lineBreakMode   = .byWordWrapping
            checkboxLabel.label.contentMode     = .topLeft
            checkboxLabel.isHidden              = true
            checkboxLabel.label.font = checkboxLabel.label.font.withSize(14)
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
    
    override func configureAppearance() {
        super.configureAppearance()
        
        addSubview(remindMeCheckbox)
        let remindMeCheckboxWidth = remindMeCheckbox.label.intrinsicContentSize.width + 20
        remindMeCheckbox.set(.top(alternateButton.bottom, 8), .leadingOf(formView, 8), .width(remindMeCheckboxWidth), .height(remindMeCheckbox._height))
        
        addSubview(acceptPromotionCheckbox)
        acceptPromotionCheckbox.set(.top(remindMeCheckbox.bottom, 6), .leadingOf(remindMeCheckbox), .trailingOf(formView, -8), .height(50))
    }
    
    @objc
    func didTapAlternateButton(_ sender: MCButton) {
        delegate?.loginView(self, didTapAlternateButton: sender, formModel: getFormViewModel(from: formView))
    }
    
    private func getFormViewModel(from actionFormView: ActionFormView) -> Login.FormModel.ViewModel {
        let username = actionFormView.getTextFieldText(with: "username")
        let password = actionFormView.getTextFieldText(with: "password")
        
        return .init(
            username: username,
            password: password,
            isRemindMe: remindMeCheckbox.isChecked,
            acceptPromotion: acceptPromotionCheckbox.isChecked
        )
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

extension LoginView: MCCheckboxDelegate {
    func checkbox(_ checkbox: MCCheckbox, didTapCheckBox isChecked: Bool) {
        acceptPromotionCheckbox.isHidden = !isChecked
    }
}

