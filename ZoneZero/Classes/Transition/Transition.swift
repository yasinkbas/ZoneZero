//
//  Transition.swift
//  ZoneZero
//
//  Created by yasinkbas on 25.07.2020.
//

import UIKit

class ZoneZeroTransition {
    enum PresentationStyle {
        case show
        case toRight
        case toLeft
        
        func start(viewController: UIViewController?, to: UIViewController) {
            switch self {
            case .show:
                viewController?.present(to, animated: true, completion: nil)
            case .toRight:
                swipeTransit(viewController: viewController, to: to, type: .push, subtype: .fromLeft)
            case .toLeft:
                swipeTransit(viewController: viewController, to: to, type: .push, subtype: .fromRight)
            }
        }
    }
    
    static func swipeTransit(
        viewController: UIViewController?,
        to: UIViewController,
        type: CATransitionType,
        subtype: CATransitionSubtype
    ) {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = type
        transition.subtype = subtype
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        viewController?.view.window!.layer.add(transition, forKey: kCATransition)
        viewController?.present(to, animated: false, completion: nil)
    }
}
