//
//  RegisterInteractor.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterBusinessLogic {
    func doSomething(request: Register.Something.Request)
}

protocol RegisterDataStore {
    //var name: String { get set }
}

class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore {
    var presenter: RegisterPresentationLogic?
    var worker: RegisterWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: Register.Something.Request) {
        worker = RegisterWorker()
        worker?.doSomeWork()
        
        let response = Register.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
