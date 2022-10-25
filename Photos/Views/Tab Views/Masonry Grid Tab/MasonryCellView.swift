//
//  MasonryCellView.swift
//  Photos
//
//  Created by bnulo on 10/22/22.
//

import SwiftUI
import Kingfisher

struct MasonryCellView: View {

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
            .frame(minWidth: 0, maxWidth: .infinity,
                   minHeight: 0, maxHeight: .infinity)
            .clipped()
            .aspectRatio(viewModel.sharedMedia.xYAspectRatio, contentMode: .fit)
    }

    private var text: some View {
        Text(viewModel.sizeInMegaByte)
            .lineLimit(Constants.Size.textLineLimit)
            .minimumScaleFactor(Constants.Size.textMinimumScaleFactor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(Constants.Size.smallPadding)
            .padding(.leading, Constants.Size.horizontalPadding)
            .background(
                VisualEffectView(
                    effect: UIBlurEffect(
                        style: .systemUltraThinMaterial))
            )
    }
}
