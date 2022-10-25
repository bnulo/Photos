//
//  Constants.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import SwiftUI

enum Constants {

    enum ImageName {

        static let photos = "photo"
        static let squareGrid1x2 = "rectangle.grid.1x2.fill"
        static let squareGrid2x2 = "square.grid.2x2.fill"
        static let squareGrid3x2 = "square.grid.3x2.fill"
        static let squareGrid4x3 = "square.grid.4x3.fill"
    }

    enum Size {

        static let cornerRadius = CGFloat(12)
        static let horizontalPadding = CGFloat(2)
        static let imageDivisor = 50
        static let lazyVStackSpacing = CGFloat(8)
        static let padding = CGFloat(8)
        static let smallPadding = CGFloat(4)
        static let textLineLimit = 1
        static let textMinimumScaleFactor = CGFloat(0.01)
        static let VStackSpacing = CGFloat(0)

        static func getImageWidth(width: Int) -> Int { width/3 }
    }
}
