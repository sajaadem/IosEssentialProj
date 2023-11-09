//
//  RemoteFeedLoader.swift
//  EssentialFeedProj
//
//  Created by saja adem on 30/08/2023.
//

import Foundation


public enum HTTPClientResult {
    case success(HTTPURLResponse)
    case failure(Error)
}

public final class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }


    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { result in
            switch result {
            case .success:
                completion(.invalidData)
            case .failure:
                completion(.connectivity)
            }
        }
    }
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
