//
//  TableViewCell.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class ZoneZeroTableViewCell: UITableViewCell, ViewAppearanceModifier {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
