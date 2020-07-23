//
//  ZoneZeroViewController.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ZoneZeroViewController<View: ZoneZeroView, Router: ZoneZeroRouter>: UIViewController {
    var v: View? { view as? View }
    
    var router: Router?
    
    // MARK: - Initialize
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureAppearance()
        setupListeners()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureAppearance()
        setupListeners()
    }
    
    convenience init(view: View) {
        self.init(nibName: nil, bundle: nil)
        self.view = view
        configureAppearance()
        setupListeners()
    }
    
    
    func configureAppearance() { }
    func setupListeners() { }
    
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
    
    
    func showAlert(title: String, message: String, actions: [AlertActionType]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach {
            alertController.addAction(UIAlertAction(title: $0.title, style: $0.actionStyle, handler: $0.handler))
        }
        present(alertController, animated: true)
    }
}
