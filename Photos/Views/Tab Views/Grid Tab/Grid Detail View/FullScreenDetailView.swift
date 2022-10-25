//
//  FullScreenDetailView.swift
//  Photos
//
//  Created by bnulo on 10/23/22.
//

import SwiftUI
import Kingfisher

struct FullScreenDetailView: View {

    @Environment(\.presentationMode) var presentation
    let viewModel: CellViewModel

    var body: some View {

            ZStack {
                Color(UIColor.systemBackground)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                photo
                    .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                presentation.wrappedValue.dismiss()
            }
    }

    // MARK: - Child View

    private var photo: some View {

        KFImage(viewModel.thumbnailUrl)
            .placeholder({
                ProgressView()
            })
            .loadImmediately()
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
}
