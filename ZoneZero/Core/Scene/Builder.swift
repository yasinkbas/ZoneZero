//
//  ZoneZeroBuilder.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol ZoneZeroRoutable {
    func route() -> UIViewController?
}

protocol ZoneZeroBuilder: ZoneZeroRoutable {
    associatedtype Buildable: ZoneZeroBuildable
    
    func setup() -> Buildable
}

extension ZoneZeroBuilder {
    func route() -> UIViewController? { setup() as? UIViewController }
}

protocol ZoneZeroBuildable { }

extension UIViewController: ZoneZeroBuildable { }
