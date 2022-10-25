//
//  GridDetailView.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import SwiftUI
import Kingfisher

struct GridDetailView: View {

    let viewModel: CellViewModel
    @State var isFullScreenDetailViewPresented = false

    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {

                VStack(spacing: Constants.Size.VStackSpacing) {

                    getImage(proxy: proxy)

                    VStack(spacing: Constants.Size.VStackSpacing) {
                        sizeText
                        dateText
                    }
                    .padding(Constants.Size.padding)
                }

                .animation(nil)
                .padding(.vertical)
                .navigationBarTitleDisplayMode(.inline)
            }
            .fullScreenCover(isPresented: $isFullScreenDetailViewPresented,
                             content: { FullScreenDetailView(viewModel: viewModel)
            })
        }
    }

    // MARK: - Child Views

    private func getImage(proxy: GeometryProxy) -> some View {

        KFImage(viewModel.thumbnailUrl)
            .placeholder({
                ProgressView()
            })
            .loadImmediately()
            .resizable()
            .scaledToFit()
            .frame(width: proxy.size.width,
                   height: proxy.size.width/viewModel.sharedMedia.xYAspectRatio)
            .onTapGesture {
                isFullScreenDetailViewPresented = true
            }
    }

    private var sizeText: some View {
        Text(viewModel.sharedMedia.sizeInMegaByte)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var dateText: some View {
        Text(
"\(viewModel.sharedMedia.createdDate, formatter: DateFormatter.ddMMMyyyyDateFormatter)")
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
