//
//  ZoneZeroInteractor.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ZoneZeroInteractor<
    View: ZoneZeroView,
    Router: ZoneZeroRouter,
    ViewController: ZoneZeroViewController<View, Router>,
    Presenter: ZoneZeroPresenter<View, Router, ViewController>> {

    var presenter: Presenter?
}
