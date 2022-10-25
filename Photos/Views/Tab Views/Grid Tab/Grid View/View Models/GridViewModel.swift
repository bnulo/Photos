//
//  GridViewModel.swift
//  Photos
//
//  Created by bnulo on 10/19/22.
//

import Foundation
import Combine

class GridViewModel: ObservableObject {

    @Published private(set) var cellViewModels: [CellViewModel] = []
    @Published private(set) var isFetching = false
    @Published private(set) var errorMessage: String = ""
    @Published var isErrorPresented = false
    @Published private(set) var gridItemSize: GridItemSize = .third

    let service: APIServiceProtocol

    init(service: APIServiceProtocol = APIManager.shared) {
        self.service = service
        fetchItems()
    }

    // MARK: -

    func fetchItems() {

        self.cellViewModels = []

        onServiceWillRequest()
        service.getListMediaInASharedItem { [self] result in
            switch result {
            case .failure(let error):
                errorMessage = error.localizedDescription
                isErrorPresented = true
            case .success(let serviceResponse):
                let items = serviceResponse
                let viewModels = items
                    .compactMap {
                        CellViewModel(sharedMedia: $0)
                    }
                DispatchQueue.main.async {
                    cellViewModels.append(contentsOf: viewModels)

                }
            }
            onServiceDidRequest()
        }
    }

    func changeLayout(to new: GridItemSize) {
        gridItemSize = new
    }

    // MARK: - Helper

    func onServiceWillRequest() {
        isFetching = true
        errorMessage = ""
        isErrorPresented = false
    }

    func onServiceDidRequest() {
        isFetching = false
    }
}
