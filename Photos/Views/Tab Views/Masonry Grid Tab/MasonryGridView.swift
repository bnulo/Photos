//
//  MasonryGridView.swift
//  Photos
//
//  Created by bnulo on 10/20/22.
//

import SwiftUI

struct MasonryGridView: View {

    @ObservedObject var viewModel: GridViewModel

    @State var gridItemSize: GridItemSize = .third
    @Namespace var namespace
    @State var width: CGFloat = 0

    let navigationTitle = "Photos"
    let menuLabelTitle = "Layout"
    let retryButtonTitle = "Retry"

    var body: some View {
        ZStack {
            Group {
                if viewModel.isFetching {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if viewModel.cellViewModels.isEmpty {
                    retryButton
                } else {
                    photoGrid
                        .animation(.interactiveSpring(), value: gridItemSize)
                }
            }
        }
        .toast(isPresented: $viewModel.isErrorPresented, message: viewModel.errorMessage)

        .navigationTitle(navigationTitle)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {

                    Button {
                        changeLayout(to: .whole)
                    } label: {
                        Label(GridItemSize.whole.name,
                              systemImage: GridItemSize.whole.imageName)
                    }

                    Button {
                        changeLayout(to: .half)
                    } label: {
                        Label(GridItemSize.half.name,
                              systemImage: GridItemSize.half.imageName)
                    }

                    Button {
                        changeLayout(to: .third)
                    } label: {
                        Label(GridItemSize.third.name,
                              systemImage: GridItemSize.third.imageName)
                    }

                }
                label: {
                    Label(menuLabelTitle, systemImage: Constants.ImageName.squareGrid3x2)
                }
            }
        }

    }

    // MARK: - SubViews

    private var photoGrid: some View {

        MasonryGrid(viewModel.cellViewModels,
                    columns: gridItemSize.columnsCount) { viewModel in

            MasonryCellView(viewModel: viewModel)
                    .matchedGeometryEffect(id: viewModel.id, in: namespace)
                    .foregroundColor(.primary)
        }
    }

    private var retryButton: some View {
        Button {
            viewModel.fetchItems()
        } label: {
            Text(retryButtonTitle)
                .foregroundColor(.blue)
                .padding()
        }
        .padding(.horizontal)
    }

    // MARK: - Helper

    private func changeLayout(to new: GridItemSize) {
        withAnimation {
            gridItemSize = new
        }
    }
}
