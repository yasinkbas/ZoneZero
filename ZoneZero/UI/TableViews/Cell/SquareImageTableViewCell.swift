//
//  SquareImageTableViewCell.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class SquareImageTableViewCell: ZoneZeroTableViewCell {
    
    var backgroundImage: UIImage? {
        didSet {
            backgroundImageView.image = backgroundImage
        }
    }
    
    private lazy var backgroundImageView =
        UIImageView().then { backgroundImage in
            backgroundImage.contentMode = .top
            backgroundImage.clipsToBounds = true
        }
    
    let bottomPadding: CGFloat
    
    init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?,
        bottomPadding: CGFloat  = 0
    ) {
        self.bottomPadding      = bottomPadding
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        setupLayout()
    }
    
    func configure(image: UIImage) {
        self.backgroundImage = image
    }
    
    func setupLayout() {
        addSubview(backgroundImageView)
        backgroundImageView.set(
            .leftOf(self),
            .topOf(self),
            .rightOf(self),
            .bottomOf(self, bottomPadding)
        )
    }
}
