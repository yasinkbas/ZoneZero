//
//  RegisterViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

protocol RegisterDisplayLogic: class {
    func displaySomething(viewModel: Register.Something.ViewModel)
}

class RegisterViewController<View: RegisterView> : UIViewController, RegisterDisplayLogic {
    var v: View? {
        return view as? View
    }
    
    var interactor: RegisterBusinessLogic?
    var router: (NSObjectProtocol & RegisterRoutingLogic & RegisterDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init(view: View) {
        self.init(nibName: nil, bundle: nil)
        self.view = view
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = Register.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Register.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
