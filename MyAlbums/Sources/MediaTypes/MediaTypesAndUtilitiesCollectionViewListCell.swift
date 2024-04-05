//
//  MediaTypesAndUtilitiesCollectionViewListCell.swift
//  MyAlbums
//
//  Created by Bema on 4/4/24.
//

import Foundation
import UIKit

final class MediaTypesAndUtilitiesCollectionViewListCell: UICollectionViewListCell {
    
    static let identifier = "MediaTypesAndUtilitiesCollectionViewListCell"

    var data: Model? {
        didSet {
            configureView()
        }
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func setupView() {
        setupDisclosureIndicator()
        setupBackground()
    }

    private func setupBackground() {
        var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfig.backgroundColor = .clear
        self.backgroundConfiguration = backgroundConfig
    }

    private func setupDisclosureIndicator() {
        let disclosureIndicatorOptions = UICellAccessory.DisclosureIndicatorOptions(
            tintColor: UIColor.lightGray
        )
        let disclosureIndicator = UICellAccessory.disclosureIndicator(options: disclosureIndicatorOptions)

        accessories = [disclosureIndicator]
    }

    private func configureView() {
        guard let data else { return }

        var content = defaultContentConfiguration()
        content.image = UIImage(systemName: data.imageName)
        content.text = data.title
        content.imageProperties.tintColor = UIColor.systemBlue

        contentConfiguration = content

        let additionalAccessory: UICellAccessory
        if data.isLocked == true {
            let image = UIImage(systemName: "lock.fill")?
                .withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
            let imageView = UIImageView(image: image)
            let viewConfiguration = UICellAccessory.CustomViewConfiguration(
                customView: imageView,
                placement: .trailing()
            )

            additionalAccessory = .customView(configuration: viewConfiguration)
        } else {
            additionalAccessory = .label(text: String(data.photoCount ?? 0))
        }

        accessories.insert(additionalAccessory, at: 0)
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        setupDisclosureIndicator()
    }
}
