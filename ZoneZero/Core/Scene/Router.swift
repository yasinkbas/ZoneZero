//
//  ZoneZeroRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ZoneZeroRouter: NSObject {
    func route(_ viewController: UIViewController?, to: UIViewController, presentationStyle: PresentationStyle) {
        presentationStyle.start(viewController: viewController, to: to)
    }
}

enum PresentationStyle {
    case show
    case toRight
    case toLeft
    
    func start(viewController: UIViewController?, to: UIViewController) {
        switch self {
        case .show:
            viewController?.present(to, animated: true, completion: nil)
        case .toRight:
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            viewController?.view.window!.layer.add(transition, forKey: kCATransition)
            viewController?.present(to, animated: false, completion: nil)
        case .toLeft:
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            viewController?.view.window!.layer.add(transition, forKey: kCATransition)
            viewController?.present(to, animated: false, completion: nil)
        }
    }
}
