//
//  CellView.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import SwiftUI
import Kingfisher

struct CellView: View {

    @ObservedObject var viewModel: CellViewModel

    var body: some View {

        ZStack {
            photo
            VStack {
                Spacer()
                text
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: Constants.Size.cornerRadius))
    }

    // MARK: - SubViews

    private var photo: some View {
        KFImage
            .url(viewModel
                    .resizedThumbnailUrl(width: Constants.Size.getImageWidth(
                        width: viewModel.sharedMedia.resx))
            )
            .placeholder({
                ProgressView()
            })
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: ViewConstants.minWidth, maxWidth: .infinity,
                   minHeight: ViewConstants.minHeight, maxHeight: .infinity)
            .clipped()
            .aspectRatio(ViewConstants.aspectRatio, contentMode: .fit)
    }

    private var text: some View {

        Text(viewModel.sizeInMegaByte)
            .lineLimit(Constants.Size.textLineLimit)
            .minimumScaleFactor(Constants.Size.textMinimumScaleFactor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Constants.Size.smallPadding)
            .padding(.horizontal, Constants.Size.horizontalPadding)
            .background(
                VisualEffectView(
                    effect: UIBlurEffect(
                        style: .systemUltraThinMaterial))
            )
    }

    // MARK: -

    private struct ViewConstants {

        static let aspectRatio = CGFloat(1)
        static let minWidth = CGFloat(0)
        static let minHeight = CGFloat(0)
    }
}
