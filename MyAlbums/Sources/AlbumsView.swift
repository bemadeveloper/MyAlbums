//
//  AlbumsView.swift
//  MyAlbums
//
//  Created by Bema on 4/4/24.
//

import Foundation
import UIKit

class AlbumsView: UIView {

    // MARK: - Outlets

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            PhotoCell.self,
            forCellWithReuseIdentifier: PhotoCell.identifier
        )
        collectionView.register(
            PeopleCollectionViewCell.self,
            forCellWithReuseIdentifier: PeopleCollectionViewCell.identifier
        )
        collectionView.register(
            PlacesCollectionViewCell.self,
            forCellWithReuseIdentifier: PlacesCollectionViewCell.identifier
        )
        collectionView.register(
            MediaTypesAndUtilitiesCollectionViewListCell.self,
            forCellWithReuseIdentifier: MediaTypesAndUtilitiesCollectionViewListCell.identifier
        )
        collectionView.register(
            AlbumsSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: AlbumsSectionHeader.identifier
        )

        return collectionView
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
        addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(self)
        }
    }
    
    // MARK: - Collection view configuration

    func configureCollectionView(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }

    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            switch sectionIndex {
            case 0:
                return createMyAlbumsLayoutSection()
            case 1:
                return createPeopleAndPlacesLayoutSection()
            case 2, 3:
                return createMediaTypesAndUtilitiesLayoutSection(
                    sectionIndex: sectionIndex,
                    layoutEnvironment: layoutEnvironment
                )
            default:
                return createMyAlbumsLayoutSection()
            }

        }

        func createMyAlbumsLayoutSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 5,
                bottom: 20,
                trailing: 5
            )

            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / 2.2),
                heightDimension: .estimated(215)
            )
            let layoutGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                repeatingSubitem: layoutItem,
                count: 2
            )

            let layoutSectionHeader = createLayoutSectionHeader()
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
            layoutSection.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 15,
                bottom: 20,
                trailing: 0
            )

            layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

            return layoutSection
        }

        func createPeopleAndPlacesLayoutSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / 2.2),
                heightDimension: .fractionalHeight(1)
            )
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1 / 2.05)
            )
            let layoutGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                repeatingSubitem: layoutItem,
                count: 2
            )
            layoutGroup.interItemSpacing = .fixed(5)

            let layoutSectionHeader = createLayoutSectionHeader()
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .continuous
            layoutSection.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 15,
                bottom: 50,
                trailing: 0
            )

            layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

            return layoutSection
        }

        func createMediaTypesAndUtilitiesLayoutSection(
            sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment
        ) -> NSCollectionLayoutSection {
            let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)

            let layoutSection = NSCollectionLayoutSection.list(
                using: configuration,
                layoutEnvironment: layoutEnvironment
            )

            layoutSection.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 0,
                bottom: 10,
                trailing: 0
            )

            let layoutSectionHeader = createLayoutSectionHeader()
            layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 15,
                bottom: 0,
                trailing: 0
            )

            layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

            return layoutSection
        }

        func createLayoutSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
            let layoutSectionHeaderSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / 1.03),
                heightDimension: .estimated(44)
            )
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: layoutSectionHeaderSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            return layoutSectionHeader
        }
    }
}
