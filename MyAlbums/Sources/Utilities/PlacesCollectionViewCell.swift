//
//  PlacesCollectionViewCell.swift
//  MyAlbums
//
//  Created by Bema on 4/4/24.
//

import Foundation
import UIKit
import SnapKit

final class PlacesCollectionViewCell: UICollectionViewCell {
    static let identifier = "PlacesCollectionViewCell"

    var photoCount: Int? {
        didSet {
            guard let photoCount else { return }
            titleSubtitleView.subTitle = String(photoCount)
        }
    }

    var mainImageName: String? {
        didSet {
            guard let mainImageName else { return }
            mainImageView.image = UIImage(named: mainImageName)
        }
    }

    // MARK: - Outlets

    private lazy var mapImageView: UIImageView = {
        let image = UIImage(named: "map")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 6.0
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var titleSubtitleView: TitleView =  {
        let view = TitleView()
        view.title = "Places"
        return view
    }()

    private lazy var triangleImageView: UIImageView = {
        let image = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3.0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Initializers

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
        [
            mapImageView,
            titleSubtitleView,
            triangleImageView,
            mainImageView,
        ].forEach { addSubview($0) }
    }

    private func setupLayout() {
        mapImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(self)
            make.width.equalTo(mapImageView.snp.height)
        }

        titleSubtitleView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(self)
            make.top.equalTo(mapImageView.snp.bottom).offset(5.0)
        }

        mainImageView.snp.makeConstraints { make in
            make.center.equalTo(mapImageView)
            make.height.width.equalTo(mapImageView).dividedBy(2.0)
        }

        triangleImageView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(-8)
            make.centerX.equalTo(mainImageView.snp.centerX)
        }
    }
}

