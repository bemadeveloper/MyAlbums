//
//  PhotoCell.swift
//  MyAlbums
//
//  Created by Bema on 1/4/24.
//
import UIKit
import SnapKit

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"
    
    var data: Model? {
        didSet {
            guard let data else { return }
            imageView.image = UIImage(named: data.imageName)
            titleSubtitleView.title = data.title
            titleSubtitleView.subTitle = String(data.photoCount ?? 0)
            favoriteImageView.isHidden = !data.isFavorite
        }
    }
    
    // MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleSubtitleView: TitleView =  {
        let view = TitleView()
        return view
    }()
    
    private lazy var favoriteImageView: UIImageView = {
        let image = UIImage(systemName: "heart.fill")?
            .withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
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
        [imageView, titleSubtitleView, favoriteImageView].forEach { addSubview($0) }
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(self)
            make.width.equalTo(imageView.snp.height)
        }

        titleSubtitleView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5.0)
            make.leading.trailing.bottom.equalTo(self)
        }
        
        favoriteImageView.snp.makeConstraints { make in
            make.leading.equalTo(imageView).offset(5.0)
            make.bottom.equalTo(imageView).offset(-5.0)
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        favoriteImageView.isHidden = true
    }
}
