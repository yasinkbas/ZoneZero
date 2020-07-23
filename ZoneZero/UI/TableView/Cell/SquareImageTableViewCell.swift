//
//  SquareImageTableViewCell.swift
//  ZoneZero
//
//  Created by yasinkbas on 23.07.2020.
//

import UIKit

class SquareImageTableViewCell: ZZTableViewCell {
    
    enum CellType {
        case `default`
        case annotated(title: String, content: String)
        
        var hasContainerView: Bool {
            switch self {
                case .default:      return false
                case .annotated:    return true
            }
        }
        
        func updateAppearance(cell: SquareImageTableViewCell) {
            switch self {
                case let .annotated(title, content):
                    cell.titleLabel.text    = title
                    cell.contentLabel.text  = content
                case .default:
                    break
            }
        }
    }
    
    private var backgroundImage: UIImage? {
        didSet {
            backgroundImageView.image = backgroundImage
        }
    }
    
    private lazy var backgroundImageView = UIImageView().then { backgroundImage in
        backgroundImage.contentMode = .scaleToFill
    }
    
    private lazy var descriptionContainerView = UIView().then { container in
        container.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6152898889)
    }
    
    private lazy var titleLabel = ZZLabel(
        text: .none,
        textStyle: .title1,
        color: .white,
        textAlignment: .left,
        fontName: .avenirNext_demibold,
        fontSize: 18
    )
    
    private lazy var contentLabel = ZZLabel(
        text: .none,
        textStyle: .body,
        color: .white,
        textAlignment: .left,
        fontName: .avenirNext_regular,
        fontSize: 16
    ).then { contentLabel in
        contentLabel.numberOfLines = 0
    }
    
    let cellType: CellType
    let bottomPadding: CGFloat
    
    init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?,
        cellType: CellType      = .default,
        bottomPadding: CGFloat  = 0
    ) {
        self.cellType           = cellType
        self.bottomPadding      = bottomPadding
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellType.updateAppearance(cell: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        addSubview(backgroundImageView)
        backgroundImageView.set(.leftOf(self), .topOf(self), .rightOf(self), .bottomOf(self, bottomPadding))
        
        if cellType.hasContainerView {
            addSubview(descriptionContainerView)
            descriptionContainerView.set(.leadingOf(self), .trailingOf(self), .heightMultiple(self.height, 0.35), .bottomOf(backgroundImageView))
            
            descriptionContainerView.addSubview(titleLabel)
            titleLabel.set(.leadingOf(descriptionContainerView, 8), .trailingOf(descriptionContainerView, 8), .topOf(descriptionContainerView, 8))
            
            descriptionContainerView.addSubview(contentLabel)
            contentLabel.set(.leadingOf(titleLabel), .trailingOf(titleLabel), .top(titleLabel.bottom, 8), .bottomOf(descriptionContainerView, 8))
        }
    }

    func configure(image: UIImage) {
        self.backgroundImage = image
    }
    
}
