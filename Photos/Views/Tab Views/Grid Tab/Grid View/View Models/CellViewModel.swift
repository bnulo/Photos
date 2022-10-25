//
//  CellViewModel.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import SwiftUI

final class CellViewModel: ObservableObject, Identifiable {

    // MARK: - Properties

    let id = UUID()
    let sharedMedia: SharedMedia

    @Published private(set) var sizeInMegaByte: String = ""
    @Published private(set) var thumbnailUrl: URL?
    @Published private(set) var font: Font = .largeTitle

    init(sharedMedia: SharedMedia) {
        self.sharedMedia = sharedMedia
        self.thumbnailUrl = ImageURLBuilder(urlString: sharedMedia.thumbnailUrlString).build()
        self.sizeInMegaByte = sharedMedia.sizeInMegaByte
    }

    // MARK: -

    func resizedThumbnailUrl(width: Int) -> URL? {

        ImageURLBuilder(urlString: sharedMedia.thumbnailUrlString)
            .width(width)
            .resizeMode(.cropped)
            .build()
    }
}

extension CellViewModel: Hashable, Equatable {

    static func == (lhs: CellViewModel, rhs: CellViewModel) -> Bool {
        return lhs.sharedMedia.id == rhs.sharedMedia.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(sharedMedia.id)
    }
}
