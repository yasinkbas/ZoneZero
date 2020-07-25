//
//  RegisterViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterDisplayLogic: class {
    func processResponseIfValidated(response: Response, viewRequest: MovieListViewRequest)
}

class RegisterViewController: ZoneZeroViewController<RegisterView, RegisterRouter>, RegisterDisplayLogic {
    
    var interactor: RegisterBusinessLogic?
    
    override var isHideKeyboardWhenTapped: Bool {
        get { true }
        set { }
    }
    
    override func setupListeners() {
        super.setupListeners()
        v?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        v?.resetForm()
    }
    
    func processResponseIfValidated(response: Response, viewRequest: MovieListViewRequest) {
        if let response = response as? ErrorResponse {
            alert(title: response.title, message: response.content, actions: [.ok(nil)])
        } else if let _ = response as? SuccessResponse {
            router?.navigateMovieList(with: viewRequest)
        }
    }
}

extension RegisterViewController: RegisterViewDelegate {
    func registerView(_ registerView: RegisterView, didTapActionButton actionButton: ZoneZeroButton, viewModel: Register.FormModel.ViewModel) {
        interactor?.register(viewModel: viewModel)
    }
    
    func registerView(_ registerView: RegisterView, didTapAlternateButton alternateButton: ZoneZeroButton, viewModel: Register.FormModel.ViewModel) {
        router?.navigateLogin()
    }
}

