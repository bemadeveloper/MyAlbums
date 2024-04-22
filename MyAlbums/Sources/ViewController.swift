//
//  ViewController.swift
//  MyAlbums
//
//  Created by Bema on 1/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var albums: [[Model]]?
    
    // MARK: - Lifecycle

    override func loadView() {
        let view = AlbumsView(frame: .zero)
        view.configureCollectionView(dataSource: self, delegate: self)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadData()
    }

    // MARK: - Setup

    private func setupView() {
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
        navigationItem.leftBarButtonItem = addButton
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Albums"
    }

    // MARK: - Data

    private func loadData() {
        albums = StructureModel.createModel()
    }

    // MARK: - Actions

    @objc private func addTapped() {
        print("Нажата ячейка +.")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        albums?.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if section == 1 {
            return 1
        }

        return albums?[section].count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            return createAlbumCollectionViewCell(collectionView, indexPath: indexPath)
        case 1:
            return createPeopleOrPlacesViewCell(collectionView, indexPath: indexPath)
        case 2, 3:
            return createMediaTypesAndUtilitiesCollectionViewListCell(collectionView, indexPath: indexPath)
        default:
            return createAlbumCollectionViewCell(collectionView, indexPath: indexPath)
        }
    }

    private func createAlbumCollectionViewCell(
        _ collectionView: UICollectionView,
        indexPath: IndexPath
    ) -> PhotoCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCell.identifier,
            for: indexPath
        ) as? PhotoCell

        cell?.data = albums?[indexPath.section][indexPath.row]

        return cell ?? PhotoCell()
    }

    private func createPeopleOrPlacesViewCell(
        _ collectionView: UICollectionView,
        indexPath: IndexPath
    ) -> UICollectionViewCell {

        if indexPath == IndexPath(item: 1, section: 1) {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PlacesCollectionViewCell.identifier,
                for: indexPath
            ) as? PlacesCollectionViewCell

            let myAlbums = albums?[0] ?? []
            let myAlbumsMainPhotos = myAlbums.map { $0.imageName }

            cell?.photoCount = myAlbums.compactMap { $0.photoCount }.reduce(0, +)
            cell?.mainImageName = myAlbumsMainPhotos[Int.random(in: 0..<myAlbumsMainPhotos.count)]

            return cell ?? PlacesCollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PeopleCollectionViewCell.identifier,
                for: indexPath) as? PeopleCollectionViewCell
            cell?.data = albums?[indexPath.section]
            
            return cell ?? PeopleCollectionViewCell()
        }
    }

    private func createMediaTypesAndUtilitiesCollectionViewListCell(
        _ collectionView: UICollectionView,
        indexPath: IndexPath
    ) -> MediaTypesAndUtilitiesCollectionViewListCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MediaTypesAndUtilitiesCollectionViewListCell.identifier,
            for: indexPath
        ) as? MediaTypesAndUtilitiesCollectionViewListCell
        cell?.data = albums?[indexPath.section][indexPath.item]

        return cell ?? MediaTypesAndUtilitiesCollectionViewListCell()
    }

    // MARK: - Section header configuration

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: AlbumsSectionHeader.identifier,
            for: indexPath
        ) as? AlbumsSectionHeader

        switch indexPath.section {
        case 0:
            header?.isSeeAllButtonHidden = false
            header?.title = "My Albums"
            header?.onButtonPressed = { print("See all button pressed") }
        case 1:
            header?.isSeeAllButtonHidden = true
            header?.title = "People & Places"
        case 2:
            header?.isSeeAllButtonHidden = true
            header?.title = "Media Types"
        case 3:
            header?.isSeeAllButtonHidden = true
            header?.title = "Utilities"
        default: break
        }

        return header ?? AlbumsSectionHeader()
    }

    // MARK: - Item selection

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath == IndexPath(item: 1, section: 1) {
            print("Нажата ячейка Places")
        } else if indexPath == IndexPath(item: 0, section: 1) {
            print("Нажата ячейка People")
        } else {
            let item = albums?[indexPath.section][indexPath.item]
            guard let item else { return }
            print("Ячейка \(item.title ?? "") нажата")
        }

        if indexPath.section == 2 ||
            indexPath.section == 3 {

            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}

