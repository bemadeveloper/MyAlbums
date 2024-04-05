//
//  PeopleCollectionViewCell.swift
//  MyAlbums
//
//  Created by Bema on 4/4/24.
//

import Foundation
import UIKit

final class PeopleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PeopleCollectionViewCell"
    private let imageCount = 4
    private let imagesNumberInRow = 2

    var data: [Model]? {
        didSet {
            guard let data, data.count == imageCount else { return }
            data.enumerated().forEach { (index, value) in
                imageViews[index].image = UIImage(named: value.imageName)
            }
            titleSubtitleView.subTitle = String(data.count)
        }
    }

    // MARK: - Outlets

    private lazy var imageViews: [UIImageView] = {
        var views: [UIImageView] = []
        for _ in 0..<imageCount {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            views.append(imageView)
        }
        return views
    }()

    private lazy var horizontalStacks: [UIStackView] = {
        var views: [UIStackView] = []
        for _ in 0..<imagesNumberInRow {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.clipsToBounds = true
            stackView.spacing = 2.0
            views.append(stackView)
        }
        return views
    }()

    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var titleSubtitleView: TitleView =  {
        let view = TitleView()
        view.title = "People"
        return view
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        var imageCounter = 0
        horizontalStacks.forEach {
            for _ in 0..<imagesNumberInRow {
                $0.addArrangedSubview(imageViews[imageCounter])
                imageCounter += 1
            }
            
            mainStack.addArrangedSubview($0)
        }
        [mainStack, titleSubtitleView].forEach { addSubview($0) }
    }

    private func setupLayout() {
        mainStack.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(self)
            make.width.equalTo(mainStack.snp.height)
        }
        
        titleSubtitleView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(self)
            make.top.equalTo(mainStack.snp.bottom).offset(5.0)
        }
    }

    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        configureImageViewCornerRadius()
    }

    private func configureImageViewCornerRadius() {
        imageViews.forEach {
            $0.layer.cornerRadius = mainStack.frame.height / Double(2 * imagesNumberInRow)
        }
    }
}
