//
//  MovieListView.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class MovieListView: ZZView, TableViewMixin {
    
    var tableView = ZZTableView(style: .plain, cell: SquareImageTableViewCell.self)

    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
        
        addSubview(tableView)
        tableView.equalToSuper()
    }
}

