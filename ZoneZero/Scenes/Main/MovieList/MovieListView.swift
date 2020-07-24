//
//  MovieListView.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class MovieListView: ZoneZeroView, TableViewMixin {
    
    lazy var tableView = ZoneZeroTableView(style: .plain, cell: SquareImageTableViewCell.self)
    
    lazy var goLogoutButton = CircleGradientButton(
        colors: [#colorLiteral(red: 0.3041562438, green: 0.6275294423, blue: 0.6819464564, alpha: 1), #colorLiteral(red: 0.9995141625, green: 0.9573079944, blue: 0.5620309711, alpha: 1)],
        symbol: "🚪").then { button in
            
        }
    
    lazy var usernameLabel = RoundedBgLabel(
        text: "asdfasdfasdf",
        textStyle: .subheadline,
        textAlignment: .center,
        fontName: .avenirNext_demibold,
        weight: .regular,
        fontSize: 18,
        color: .white,
        backgroundColor: #colorLiteral(red: 0.4338980913, green: 0.6864604354, blue: 0.6585809588, alpha: 1),
        cornerRadius: 15
    )
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func setupLayout() {
        super.setupLayout()
        addSubview(tableView)
        tableView.equalToSuper()
        
        addSubview(goLogoutButton)
        goLogoutButton.set(.centerXOf(self), .bottomOf(self, 12), .widthMultiple(self.height, 0.08), .heightMultiple(self.height, 0.08))
        
        addSubview(usernameLabel)
        usernameLabel.set(.centerYOf(goLogoutButton), .rightOf(self, 16), .heightMultiple(goLogoutButton.height, 0.7), .width(usernameLabel.intrinsicContentSize.width))
    }
    
    func configure(username: String) {
        usernameLabel.text = username
    }
}

