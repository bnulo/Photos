//
//  GridView.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import SwiftUI

struct GridView: View {

    @ObservedObject var viewModel: GridViewModel

    let animation: Animation = .interactiveSpring()
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

                    Button {
                        changeLayout(to: .quarter)
                    } label: {
                        Label(GridItemSize.quarter.name,
                              systemImage: GridItemSize.quarter.imageName)
                    }
                }
                label: {
                    Label(menuLabelTitle,
                          systemImage: Constants.ImageName.squareGrid3x2)
                }
            }
        }
    }

    // MARK: - SubViews

    private var photoGrid: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.gridItemSize.columns,
                      spacing: Constants.Size.lazyVStackSpacing) {
                ForEach(viewModel.cellViewModels, id: \.self) { viewModel in

                    NavigationLink {
                        GridDetailView(viewModel: viewModel)
                    } label: {
                        CellView(viewModel: viewModel)
                            .foregroundColor(.primary)
                    }
               }
           }
           .padding(.horizontal)
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
        withAnimation(animation) {
            viewModel.changeLayout(to: new)
        }
    }
}
