//
//  ZZBuilder.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol ZZRoutable {
    func route() -> UIViewController?
}

protocol ZZBuilder: ZZRoutable {
    associatedtype Buildable: ZZBuildable
    
    func setup() -> Buildable
}

extension ZZBuilder {
    func route() -> UIViewController? { setup() as? UIViewController }
}

protocol ZZBuildable { }

extension UIViewController: ZZBuildable { }
