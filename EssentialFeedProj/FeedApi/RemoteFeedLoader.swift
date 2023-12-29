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
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }


    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }


    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
                guard self != nil else { return }
            switch result {
            case let .success(data, response):
                completion(FeedItemsMapper.map(data, from: response))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
