//
//  FeedLoader.swift
//  EssentialFeedProj
//
//  Created by saja adem on 30/08/2023.
//

import Foundation

enum LoadFeedResult {
    case error(Error)
    case success([FeedItem])
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
