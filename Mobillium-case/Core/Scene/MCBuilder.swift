//
//  MCBuilder.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol MCViewPresenter {
    func route() -> UIViewController?
}

protocol MCBuilder: MCViewPresenter {
    associatedtype Buildable: MCBuildable
    
    func make() -> Buildable
}

extension MCBuilder {
    func route() -> UIViewController? { make() as? UIViewController }
}

protocol MCBuildable { }

extension UIViewController: MCBuildable { }
