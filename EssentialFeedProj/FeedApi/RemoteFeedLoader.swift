//
//  RemoteFeedLoader.swift
//  EssentialFeedProj
//
//  Created by saja adem on 30/08/2023.
//

import Foundation


public final class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load() {
        client.get(from: url)
    }
}

public protocol HTTPClient {
    func get(from url: URL)
}
