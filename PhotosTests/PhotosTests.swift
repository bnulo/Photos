//
//  PhotosTests.swift
//  PhotosTests
//
//  Created by bnulo on 10/19/22.
//

import XCTest
@testable import Photos
import Alamofire
import Combine

class PhotosTests: XCTestCase {

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    var subscriptions = Set<AnyCancellable>()

    override func tearDown() {
        subscriptions = []
    }

    // MARK: - Success

    func test_getListMediaInASharedItem_success() {

        let result = Result<[SharedMedia], AFError>
            .success(SharedMedia.items)
        let viewModel = GridViewModel(service: APIMockService(result: result))
        let promise = expectation(description: "getting SharedMedia items")
        viewModel.$cellViewModels.sink { viewModels in
            if viewModels.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)

        wait(for: [promise], timeout: 2)
    }

    // MARK: - Failure

    func test_getListMediaInASharedItem_failure() {

        let result = Result<[SharedMedia], AFError>
            .failure(
                AFError
                    .urlRequestValidationFailed(
                        reason: AFError.URLRequestValidationFailureReason
                            .bodyDataInGETRequest(Data())))

        let viewModel = GridViewModel(service: APIMockService(result: result))
        viewModel.fetchItems()
        let promise = expectation(description: "show error message")
        viewModel.$cellViewModels.sink { viewModels in
            if !viewModels.isEmpty {
                XCTFail("viewModels list has to be empty on service failure")
            }
        }.store(in: &subscriptions)

        viewModel.$errorMessage.sink { message in
            if !message.isEmpty {
                promise.fulfill()
            }
        }.store(in: &subscriptions)

        wait(for: [promise], timeout: 2)
    }

}
