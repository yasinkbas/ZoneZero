//
//  MCViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class MCViewController<View: MCView, Router: MCRouter>: UIViewController {
    var v: View? { view as? View }
    
//    var interactor: MainBusinessLogic?
//    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
//    var interactor: MCInteractor?
    var router: MCRouter?
    
    // MARK: - Initialize
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureAppearance()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureAppearance()
        setup()
    }
    
    convenience init(view: View) {
        self.init(nibName: nil, bundle: nil)
        self.view = view
    }
    
    func setup() { }
    
    func configureAppearance() { }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
    
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}
