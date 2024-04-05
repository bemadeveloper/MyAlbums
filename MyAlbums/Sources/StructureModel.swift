//
//  MyAlbumsFactory.swift
//  MyAlbums
//
//  Created by Bema on 2/4/24.
//

import Foundation

struct StructureModel {
    static func createModel() -> [[Model]] {
        [
            [
                Model(
                    title: "Recents",
                    imageName: "photo1",
                    photoCount: 5932
                ),
                Model(
                    title: "Family Reunion",
                    imageName: "photo2",
                    photoCount: 92
                ),
                Model(
                    title: "Favorites",
                    imageName: "photo3",
                    photoCount: 432,
                    isFavorite: true
                ),
                Model(
                    title: "August Memories",
                    imageName: "photo4",
                    photoCount: 87
                ),
                Model(
                    title: "Smile",
                    imageName: "photo5",
                    photoCount: 138
                ),
                Model(
                    title: "Nature",
                    imageName: "photo6",
                    photoCount: 647
                ),
                Model(
                    title: "Books",
                    imageName: "photo7",
                    photoCount: 765
                ),
                Model(
                    title: "Myself",
                    imageName: "photo8",
                    photoCount: 4
                ),
            ],
            [
                Model(imageName: "photo9"),
                Model(imageName: "photo10"),
                Model(imageName: "photo11"),
                Model(imageName: "photo12"),
            ],
            [
                Model(
                    title: "Videos",
                    imageName: "video",
                    photoCount: 3
                ),
                Model(
                    title: "Selfies",
                    imageName: "person.crop.square",
                    photoCount: 1
                ),
                Model(
                    title: "Live Photos",
                    imageName: "livephoto",
                    photoCount: 9
                ),
                Model(
                    title: "Portrait",
                    imageName: "f.cursive.circle",
                    photoCount: 14
                ),
                Model(
                    title: "Time-lapse",
                    imageName: "timelapse",
                    photoCount: 543
                ),
                Model(
                    title: "Slo-mo",
                    imageName: "slowmo",
                    photoCount: 14
                ),
                Model(
                    title: "Cinematic",
                    imageName: "video.bubble",
                    photoCount: 43
                ),
                Model(
                    title: "Bursts",
                    imageName: "square.stack.3d.down.right",
                    photoCount: 34
                ),
                Model(
                    title: "Screenshots",
                    imageName: "camera.viewfinder",
                    photoCount: 459
                ),
                Model(
                    title: "Screen Recordings",
                    imageName: "record.circle",
                    photoCount: 193
                ),
                Model(
                    title: "Animated",
                    imageName: "square.stack.3d.forward.dottedline",
                    photoCount: 14
                ),
            ],
            [
                Model(
                    title: "Imports",
                    imageName: "square.and.arrow.down",
                    photoCount: 21
                ),
                Model(
                    title: "Hidden",
                    imageName: "eye.slash",
                    photoCount: 45,
                    isLocked: true
                ),
                Model(
                    title: "Recently Deleted",
                    imageName: "trash",
                    photoCount: 32,
                    isLocked: true
                ),
            ],
        ]
    }
}

