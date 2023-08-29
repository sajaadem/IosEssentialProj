//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedProjUITests
//
//  Created by saja adem on 29/08/2023.
//

import XCTest
import EssentialFeedProj

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_loadTwice_requestsDataFromURLTwice() {
        let url = URL(string: "https://any_url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        sut.load()
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://any_url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        XCTAssertEqual(client.requestedURLs, [url])
    }

    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }

    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://any_url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }

    private class HTTPClientSpy: HTTPClient {
        var requestedURLs = [URL]()
        
        func get(from url: URL) {
            requestedURLs.append(url)
        }
    }

}
