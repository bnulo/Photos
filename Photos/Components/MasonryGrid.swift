//
//  MasonryGrid.swift
//  Photos
//
//  Created by bnulo on 10/22/22.
//

import SwiftUI

struct MasonryGrid<Content: View, T: Identifiable>: View where T: Hashable {

    var content: (T) -> Content
    var list: [T]

    var showsIndicators: Bool
    var spacing: CGFloat
    var columns: Int

    let hSpacing = CGFloat(12)

    init(_ list: [T], showsIndicators: Bool = false, spacing: CGFloat = 12,
         columns: Int = 2, @ViewBuilder content: @escaping (T) -> Content) {

        self.showsIndicators = showsIndicators
        self.spacing = spacing
        self.columns = columns
        self.list = list
        self.content = content
    }

    var body: some View {

        ScrollView(.vertical, showsIndicators: showsIndicators) {
            HStack(alignment: .top, spacing: hSpacing) {
                ForEach(setupList(), id: \.self) { columnsData in
                    LazyVStack(spacing: spacing) {
                        ForEach(columnsData) { item in
                            content(item)
                        }
                    }
                }
            }
            .padding()
        }
    }

    // MARK: -

    func setupList() -> [[T]] {

        var gridArray: [[T]] = Array(repeating: [], count: columns)
        var currentIndex = 0
        for item in list {
            gridArray[currentIndex].append(item)
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        return gridArray
    }
}
