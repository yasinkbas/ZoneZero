//
//  ZoneZeroPresenter.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ZoneZeroPresenter<
    View: ZoneZeroView,
    Router: ZoneZeroRouter,
    ViewController: ZoneZeroViewController<View, Router>
> {
    weak var viewController: ViewController?
}
