//
//  ZoneZeroRouter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ZoneZeroRouter: NSObject {
    func route(_ viewController: UIViewController?, to: UIViewController, presentationStyle: ZoneZeroTransition.PresentationStyle) {
        presentationStyle.start(viewController: viewController, to: to)
    }
}
