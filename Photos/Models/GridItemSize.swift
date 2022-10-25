//
//  GridItemSize.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation
import SwiftUI

enum GridItemSize: CaseIterable, Identifiable, Hashable {

    case whole, half, third, quarter

    static var allCases: [GridItemSize] { [GridItemSize.whole, .half, .third, .quarter] }
    var name: String {
        switch self {
        case .whole:
            return "Whole"
        case .half:
            return "Half"
        case .third:
            return "Third"
        case .quarter:
            return "Quarter"
        }
    }

    var id: String { return self.name }

    var imageName: String {

        switch self {
        case .whole:
            return Constants.ImageName.squareGrid1x2
        case .half:
            return Constants.ImageName.squareGrid2x2
        case .third:
            return Constants.ImageName.squareGrid3x2
        case .quarter:
            return Constants.ImageName.squareGrid4x3
        }
    }

    var columnsCount: Int {
        switch self {
        case .whole:
            return 1
        case .half:
            return 2
        case .third:
            return 3
        default:
            return 3
        }
    }

    var imageDivisor: Int {
        switch self {
        case .whole:
            return 1
        case .half:
            return 2
        case .third:
            return 3
        case .quarter:
            return 4
        }
    }

    var columns: [GridItem] {
        switch self {
        case .whole:
            return [
                GridItem(.flexible())
            ]
        case .half:
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .third:
            return [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .quarter:
            return [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        }
    }
}
