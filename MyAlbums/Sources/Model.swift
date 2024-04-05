//
//  Model.swift
//  MyAlbums
//
//  Created by Bema on 1/4/24.
//

import Foundation
import UIKit

struct Model {
    let title: String?
    let imageName: String
    let photoCount: Int?
    let isFavorite: Bool
    let isLocked: Bool?

    init(
        title: String? = nil,
        imageName: String,
        photoCount: Int? = nil,
        isFavorite: Bool = false,
        isLocked: Bool? = nil
    ) {
        self.title = title
        self.imageName = imageName
        self.photoCount = photoCount
        self.isFavorite = isFavorite
        self.isLocked = isLocked
    }
}
