//
//  ZoneZeroView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol ViewAppearanceModifier {
    func configureAppearance()
    func setupListeners()
    func setupLayout()
}

extension ViewAppearanceModifier {
    func setupListeners() { }
    func setupLayout()    { }
}

class ZoneZeroView: UIView, ViewAppearanceModifier {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
        setupLayout()
        setupListeners()
        hideKeyboardWhenTapped()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout()          { }
    func setupListeners()       { }
    func configureAppearance()  { }

    // MARK:- Hiding Keyboard
    private func hideKeyboardWhenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedOnView))
        addGestureRecognizer(tap)
    }

    @objc
    func tappedOnView() {
        endEditing(true)
    }
}
