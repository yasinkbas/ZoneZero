//
//  ZoneZeroViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ZoneZeroViewController<
    View: ZoneZeroView,
    Router: ZoneZeroRouter
>: UIViewController {
    var v: View? { view as? View }
    
    var router: Router?
    
    // MARK: - Initialize
    
    init(view: View) {
        super.init(nibName: nil, bundle: nil)
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureAppearance() { }
    func setupListeners() { }
    
    func setup() {
        configureAppearance()
        setupListeners()
    }
    
    // MARK: - Overrides
    
    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}

// MARK: - Alert
extension ZoneZeroViewController {
    enum AlertActionType {
        typealias Handler = ((UIAlertAction) -> ())
        case ok(Handler? = nil)
        case cancel(Handler? = nil)
        
        var handler: Handler? {
            value.handler
        }
        
        var title: String {
            value.title
        }
        
        var actionStyle: UIAlertAction.Style {
            value.style
        }
        
        private var value: (title: String, handler: Handler?, style: UIAlertAction.Style) {
            switch self {
            case let .ok(handler): return ("Ok", handler, .default)
            case let .cancel(handler): return ("Cancel", handler, .cancel)
            }
        }
    }
    
    
    func alert(title: String, message: String, actions: [AlertActionType]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach {
            alertController.addAction(UIAlertAction(title: $0.title, style: $0.actionStyle, handler: $0.handler))
        }
        present(alertController, animated: true)
    }
}
