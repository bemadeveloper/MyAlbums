//
//  AlbumsSectionHeader.swift
//  MyAlbums
//
//  Created by Bema on 4/4/24.
//

import Foundation
import UIKit

typealias VoidClosure = () -> Void

final class AlbumsSectionHeader: UICollectionReusableView {
    static let identifier = "MyAlbumsSectionHeader"

    var isSeeAllButtonHidden: Bool = true {
        didSet {
            seeAllButton.isHidden = isSeeAllButtonHidden
        }
    }

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var onButtonPressed: VoidClosure? {
        didSet {
            seeAllButton.addTarget(
                self,
                action: #selector(onSeeAllButtonPressed),
                for: .touchUpInside
            )
        }
    }

    // MARK: - Outlets

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        return button
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
        [separatorView, titleLabel, seeAllButton].forEach { addSubview($0) }
    }

    private func setupLayout() {
        separatorView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(self)
            make.height.equalTo(1.0)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(10.0)
            make.leading.equalTo(self)
        }

        seeAllButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(self).offset(-10.0)
        }
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        seeAllButton.isHidden = true
    }

    // MARK: - Actions

    @objc private func onSeeAllButtonPressed() {
        onButtonPressed?()
    }
}

