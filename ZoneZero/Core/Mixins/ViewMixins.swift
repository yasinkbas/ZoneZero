//
//  TableViewMixin.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

protocol TableViewMixin: UIView {
    associatedtype TableView: UITableView
   
    var tableView: TableView { get set }
    var cellHeight: CGFloat { get }
}

extension ZoneZeroViewController where View: TableViewMixin {
    @nonobjc
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return v!.cellHeight
    }
}
