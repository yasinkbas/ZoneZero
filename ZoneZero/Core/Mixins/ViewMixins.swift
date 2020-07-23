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
}
