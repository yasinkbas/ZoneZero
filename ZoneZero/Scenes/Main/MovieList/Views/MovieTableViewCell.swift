//
//  MovieTableViewCell.swift
//  ZoneZero
//
//  Created by yasinkbas on 25.07.2020.
//

import UIKit

class MovieTableViewCell: SquareImageTableViewCell {
    
    static var identifier = "movieListCell"
    
    lazy var movieImageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFit
    }
    
    lazy var titleLabel = ZoneZeroLabel(
        text: .none,
        textStyle: .title3,
        color: .white,
        textAlignment: .left,
        fontName: .avenirNext_demibold,
        fontSize: 24
    )
    
    lazy var imdbField = MovieCellField(
        leftSide: "imdb",
        rightSide: .none,
        spacing: 8
    )
    lazy var directorField = MovieCellField(
        leftSide: "Director",
        rightSide: .none,
        spacing: 8
    )
    lazy var writersField = MovieCellField(
        leftSide: "Writers",
        rightSide: .none,
        spacing: 8
    )
    lazy var starsField = MovieCellField(
        leftSide: "Stars",
        rightSide: .none,
        spacing: 8
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, bottomPadding: CGFloat = 0) {
        super.init(style: style, reuseIdentifier: reuseIdentifier, bottomPadding: bottomPadding)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        addSubview(movieImageView)
        movieImageView.set(
            .topOf(self, 4),
            .leftOf(self, 8),
            .widthMultiple(self.width, 0.3),
            .bottomOf(self, 8 + bottomPadding)
        )
        
        let paddingBetweenImageAndFields: CGFloat   = 10
        let paddingBetweenFields: CGFloat           = 30
        
        addSubview(titleLabel)
        titleLabel.set(.left(movieImageView.right, paddingBetweenImageAndFields), .rightOf(self, 8), .topOf(self, 6))
        
        addSubview(imdbField)
        imdbField.set(.top(titleLabel.bottom, paddingBetweenFields), .leftOf(titleLabel), .rightOf(titleLabel))
        
        addSubview(directorField)
        directorField.set(.top(imdbField.bottom, paddingBetweenFields), .leftOf(titleLabel), .rightOf(titleLabel))
        
        addSubview(writersField)
        writersField.set(.top(directorField.bottom, paddingBetweenFields), .leftOf(titleLabel), .rightOf(titleLabel))
        
        addSubview(starsField)
        starsField.set(.top(writersField.bottom, paddingBetweenFields), .leftOf(titleLabel), .rightOf(titleLabel))
    }
    
    @discardableResult
    func with(viewModel: MovieList.Movie.ViewModel) -> Self {
        movieImageView.image    = viewModel.image
        titleLabel.text         = viewModel.title
        
        imdbField.configure(
            rightSide: "\(viewModel.imdb)"
        )
        directorField.configure(
            rightSide: viewModel.director
        )
        writersField.configure(
            rightSide: viewModel.writers
        )
        starsField.configure(
            rightSide: viewModel.stars
        )
        
        return self
    }
}

extension MovieTableViewCell {
    class MovieCellField: ZoneZeroView {
        
        let leftSide: String
        let rightSide: String
        let spacing: CGFloat
        
        init(
            leftSide: String,
            rightSide: String = .none,
            spacing: CGFloat
        ) {
            self.leftSide   = leftSide
            self.rightSide  = rightSide
            self.spacing    = spacing
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        lazy var leftSideLabel = ZoneZeroLabel(
            text: "\(leftSide):",
            textStyle: .caption1,
            color: .white,
            textAlignment: .left,
            fontName: .avenirNext_regular,
            fontSize: 18
        )
        
        lazy var rightSideLabel = ZoneZeroLabel(
            text: rightSide,
            textStyle: .body,
            color: .white,
            textAlignment: .left,
            fontName: .avenirNext_demibold,
            fontSize: 16
        )
        
        override func configureAppearance() {
            super.configureAppearance()
            
        }
        
        override func setupLayout() {
            super.setupLayout()
            addSubview(leftSideLabel)
            leftSideLabel.set(
                .leftOf(self),
                .centerYOf(self),
                .width(leftSideLabel.intrinsicContentSize.width)
            )
            
            addSubview(rightSideLabel)
            rightSideLabel.set(
                .rightOf(self),
                .centerYOf(leftSideLabel),
                .left(leftSideLabel.right, spacing),
                .width(leftSideLabel.intrinsicContentSize.width)
            )
        }
        
        func configure(rightSide: String) {
            self.rightSideLabel.text = rightSide
            setNeedsLayout()
        }
    }
}
