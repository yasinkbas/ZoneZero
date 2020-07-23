//
//  TableView.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class ZZTableView<Cell: UITableViewCell>: UITableView, ViewAppearanceModifier {
    
    let cell: Cell.Type
    
    init(style: UITableView.Style, cell: Cell.Type) {
        self.cell = cell
        super.init(frame: .zero, style: style)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() {
        backgroundColor = .clear
    }
}
