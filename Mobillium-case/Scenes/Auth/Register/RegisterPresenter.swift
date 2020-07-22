//
//  RegisterPresenter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterPresentationLogic {
    func presentSomething(response: Register.Something.Response)
}

class RegisterPresenter: RegisterPresentationLogic {
    weak var viewController: RegisterDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Register.Something.Response) {
        let viewModel = Register.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
