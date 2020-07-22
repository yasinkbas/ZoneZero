//
//  MCView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class MCView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
        hideKeyboardWhenTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() { }
    
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
