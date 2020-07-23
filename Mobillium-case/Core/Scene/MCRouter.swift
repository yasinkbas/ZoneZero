//
//  MCRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class MCRouter: NSObject {
    func route(_ viewController: UIViewController?, builder: MCRoutable, presentationStyle: PresentationStyle) {
        presentationStyle.start(viewController: viewController, to: builder)
    }
}

enum PresentationStyle {
    case show
    case toRight
    case toLeft
    
    func start(viewController: UIViewController?, to builder: MCRoutable) {
        switch self {
        case .show:
            viewController?.present(builder.route()!, animated: true, completion: nil)
        case .toRight:
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            viewController?.view.window!.layer.add(transition, forKey: kCATransition)
            viewController?.present(builder.route()!, animated: false, completion: nil)
        case .toLeft:
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            viewController?.view.window!.layer.add(transition, forKey: kCATransition)
            viewController?.present(builder.route()!, animated: false, completion: nil)
        }
    }
}
