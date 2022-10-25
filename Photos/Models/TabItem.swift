//
//  TabItem.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation

enum TabItem: Int, Identifiable {

    case gridPhotos = 1, masonryPhotos = 2

    var id: Int { return self.rawValue }

    var title: String {
        switch self {
        case .gridPhotos:
            return "Grid"
        case .masonryPhotos:
            return "Mansory"
        }
    }

    var imageName: String {
        switch self {
        case .gridPhotos:
            return Constants.ImageName.photos
        case .masonryPhotos:
            return "photo.on.rectangle"
        }
    }

}
