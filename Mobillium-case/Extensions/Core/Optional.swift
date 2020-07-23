//
//  Optional.swift
//  Mobillium-case
//
//  Created by yasinkbas on 23.07.2020.
//

import Foundation

extension Optional {
    func unwrap(_ closure: (Wrapped) -> Void) {
        guard let self = self else { return }
        closure(self)
    }
}

