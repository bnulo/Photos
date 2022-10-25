//
//  ContentView.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            TabView {

                // MARK: - Grid Tab

                NavigationView {
                    GridView(viewModel: GridViewModel())
                }
                .tabItem {
                    Image(systemName: TabItem.gridPhotos.imageName)
                    Text(TabItem.gridPhotos.title)
                }
                .tag(TabItem.gridPhotos.id)

                // MARK: - Masonary Tab

                NavigationView {
                    MasonryGridView(viewModel: GridViewModel())
                }
                .tabItem {
                    Image(systemName: TabItem.masonryPhotos.imageName)
                    Text(TabItem.masonryPhotos.title)
                }
                .tag(TabItem.masonryPhotos.id)
            }
        }

    }
}
