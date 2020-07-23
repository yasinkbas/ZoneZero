//
//  TableViewDataSource.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

///<reference>:  https://www.swiftbysundell.com/articles/reusable-data-sources-in-swift/
class ZoneZeroTableViewDataSource<Model>: NSObject, UITableViewDataSource {
    typealias CellConfigurator = (Model, UITableViewCell) -> Void
    
    var models: [Model]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    init(
        models: [Model],
        reuseIdentifier: String,
        cellConfigurator: @escaping CellConfigurator
    ) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return models.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        )
        
        cellConfigurator(model, cell)
        
        return cell
    }
}
