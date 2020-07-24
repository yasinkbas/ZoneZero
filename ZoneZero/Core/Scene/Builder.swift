//
//  ZoneZeroBuilder.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol ZoneZeroBuilder: ZoneZeroRoutable {
    associatedtype Buildable: ZoneZeroBuildable
    associatedtype Request: ZoneZeroViewRequest
    
    func setup(with request: Request) -> Buildable
}

