//
//  MovieListView.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class MovieListView: ZoneZeroView, TableViewMixin {
    var cellHeight: CGFloat { 300 }
    
    var viewRequest: MovieListViewRequest
    
    init(viewRequest: MovieListViewRequest) {
        self.viewRequest = viewRequest
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backgroundImage = UIImageView().then { backgroundImage in
        backgroundImage.image = Images.movielist_background
    }
    
    lazy var tableView = ZoneZeroTableView(style: .plain, cell: MovieTableViewCell.self).then { tableView in
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5018200644)
    }
    
    lazy var logoutButton = CircleGradientButton(
        colors: [#colorLiteral(red: 0.4037427497, green: 0.1702677981, blue: 0.2085620941, alpha: 1), #colorLiteral(red: 0.1962940693, green: 0.2115930617, blue: 0.3174170554, alpha: 1)],
        symbol: "Logout"
    ).then { logoutButton in
        logoutButton.titleLabel?.font = UIFont(name: .avenirNext_demibold, size: 14)
    }
    
    lazy var usernameLabel = RoundedBgLabel(
        text: viewRequest.username,
        textStyle: .subheadline,
        textAlignment: .center,
        fontName: .avenirNext_demibold,
        weight: .regular,
        fontSize: 18,
        color: .white,
        backgroundColor: #colorLiteral(red: 0.4037427497, green: 0.1702677981, blue: 0.2085620941, alpha: 1),
        cornerRadius: 15
    )
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func setupLayout() {
        super.setupLayout()
        addSubview(backgroundImage)
        backgroundImage.equalToSuper()
        
        addSubview(tableView)
        tableView.equalToSuper()
        
        addSubview(logoutButton)
        logoutButton.set(
            .centerXOf(self),
            .bottomOf(self, 12),
            .widthMultiple(self.height, 0.08),
            .heightMultiple(self.height, 0.08)
        )
        
        addSubview(usernameLabel)
        usernameLabel.set(
            .rightOf(self, 16),
            .centerYOf(logoutButton),
            .heightMultiple(logoutButton.height, 0.7),
            .width(usernameLabel.intrinsicContentSize.width + 10)
        )
    }
    
    func configure(username: String) {
        usernameLabel.text = username
        setNeedsLayout()
        layoutIfNeeded()
    }
}

